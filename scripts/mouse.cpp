#include <atomic>
#include <chrono>
#include <cstdlib>
#include <cstring>
#include <dirent.h>
#include <fcntl.h>
#include <iostream>
#include <libevdev-1.0/libevdev/libevdev.h>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <unistd.h>

std::string findKeydVirtualKeyboard() {
  DIR *dir = opendir("/dev/input");
  if (!dir) {
    std::cerr << "Failed to open /dev/input directory" << std::endl;
    return "";
  }

  struct dirent *entry;
  std::string devicePath;

  while ((entry = readdir(dir)) != NULL) {
    std::string device = entry->d_name;
    if (device.find("event") != std::string::npos) {
      devicePath = "/dev/input/" + device;
      int fd = open(devicePath.c_str(), O_RDONLY);
      if (fd < 0) {
        continue;
      }

      struct libevdev *dev = nullptr;
      int rc = libevdev_new_from_fd(fd, &dev);
      if (rc < 0) {
        close(fd);
        continue;
      }

      if (strcmp(libevdev_get_name(dev), "keyd virtual keyboard") == 0) {
        libevdev_free(dev);
        close(fd);
        closedir(dir);
        return devicePath;
      }

      libevdev_free(dev);
      close(fd);
    }
  }

  closedir(dir);
  std::cerr << "keyd virtual keyboard not found!" << std::endl;
  return "";
}

void moveMouseWhileKeyHeld(std::atomic<bool> &moveH, std::atomic<bool> &moveJ,
                           std::atomic<bool> &moveK, std::atomic<bool> &moveL,
                           std::atomic<bool> &speedDecrease) {
  int normalSpeed = 12;
  int slowSpeed = 4;

  while (true) {
    int speed = speedDecrease ? slowSpeed : normalSpeed;

    if (moveH) {
      std::system(
          ("echo 'mousemove -" + std::to_string(speed) + " 0' | dotoolc")
              .c_str());
    }
    if (moveJ) {
      std::system(("echo 'mousemove 0 " + std::to_string(speed) + "' | dotoolc")
                      .c_str());
    }
    if (moveK) {
      std::system(
          ("echo 'mousemove 0 -" + std::to_string(speed) + "' | dotoolc")
              .c_str());
    }
    if (moveL) {
      std::system(("echo 'mousemove " + std::to_string(speed) + " 0' | dotoolc")
                      .c_str());
    }

    std::this_thread::sleep_for(
        std::chrono::milliseconds(5)); // Control mouse movement speed
  }
}

int main() {
  std::string devicePath = findKeydVirtualKeyboard();
  int fd = open(devicePath.c_str(), O_RDONLY);
  if (fd < 0) {
    std::cerr << "Error: Cannot open device " << devicePath << std::endl;
    return 1;
  }

  struct libevdev *dev = nullptr;
  int rc = libevdev_new_from_fd(fd, &dev);
  if (rc < 0) {
    std::cerr << "Error: Failed to create evdev device" << std::endl;
    close(fd);
    return 1;
  }

  std::atomic<bool> moveH(false), moveJ(false), moveK(false), moveL(false);
  std::atomic<bool> superPressed(false);
  std::atomic<bool> speedDecrease(
      false); // Flag for reduced speed when 'Z' is pressed

  // Start the mouse movement thread
  std::thread movementThread(moveMouseWhileKeyHeld, std::ref(moveH),
                             std::ref(moveJ), std::ref(moveK), std::ref(moveL),
                             std::ref(speedDecrease));

  while (true) {
    struct input_event ev;
    rc = libevdev_next_event(dev, LIBEVDEV_READ_FLAG_NORMAL, &ev);
    if (rc == 0 && ev.type == EV_KEY) {
      if (ev.code == KEY_LEFTMETA || ev.code == KEY_RIGHTMETA) {
        superPressed = (ev.value != 0);
        if (!superPressed) { // Reset on Super key release
          moveH = moveJ = moveK = moveL = false;
          speedDecrease = false;
        }
      } else if (superPressed) {
        switch (ev.code) {
        case KEY_H:
          moveH = (ev.value != 0);
          break;
        case KEY_J:
          moveJ = (ev.value != 0);
          break;
        case KEY_K:
          moveK = (ev.value != 0);
          break;
        case KEY_L:
          moveL = (ev.value != 0);
          break;
        case KEY_Z:
          speedDecrease =
              (ev.value != 0); // Reduce speed when 'Z' is held with 'Super'
          break;
        default:
          break; // Ignore other keys when Super is pressed
        }
      } else {
        // Process other key events normally (i.e., H, J, K, L will be typed if
        // Super is not pressed)
        switch (ev.code) {
        case KEY_H:
        case KEY_J:
        case KEY_K:
        case KEY_L:
          // You can add logic here to pass the keys to the system if needed
          break;
        default:
          // Handle other key events
          break;
        }
      }
    }
  }

  // Cleanup (will never be reached due to the infinite loop)
  movementThread.join();
  libevdev_free(dev);
  close(fd);
  return 0;
}
