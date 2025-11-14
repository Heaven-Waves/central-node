# Central Node 📡

### Project that build entire custom Raspberry Pi OS Lite bootable image 💿

This image is intended to be used on [Raspberry Pi 4B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/) with 4G RAM 🍓 to turn this machine into a central node / server that accepts audio from Bluetooth

> Yes, you read it, you can connect your phone to it

and streams it via RTP multicast to multiple [ESP32-LyraT V4.3](https://docs.espressif.com/projects/esp-adf/en/latest/design-guide/dev-boards/get-started-esp32-lyrat.html) [`peripheral-node`s](https://github.com/Heaven-Waves/peripheral-node) in your local network.

## Raspberry Pi 4 model B

> You know it well

<p align="center">
<img
     alt="Raspberry Pi 4 model B"
     src="https://raw.githubusercontent.com/Heaven-Waves/assets/main/img/RaspberryPi-4-model-B.png"
     width="500"
     >
</p>

## Dependencies

Verry simple because the only actually required dependancy is

### 🐋 Docker

Because everything in this repository (configurations, environments, etc.) is dockerized, making things easily portable.

## How to use

Running this command within your `bash` shell:

```bash
docker compose up
```

will build the docker containers that will run it's task to create the `*.img` file.

There are provided default variable for:

- new default user credentials
- password to `root` user
- Wi-Fi SSID and password to connect to

Navigating to `config/vars` the default values could be **overriden** by creating files and variables with the same.

Example configuration:

`config/vars/credentials.yml`:

```yml
user_name: thesis
user_password: thesis

root_password: very_strong_root_password_here
```

`config/vars/wifi.yml`:

```yml
wifi_ssid: My_Router_SSID
wifi_password: My_Router_Password
```

### ⌛ This will take some time

You can use [Docker Desktop](https://www.docker.com/products/docker-desktop/) to watch the logs from the containers to see the process going
or you can type

```bash
# for the emulator output
docker logs -f central-node-pi-emulator-1

# for the configuration of the image
docker logs -f central-node-ansible-1
```

## Software used

- 🍓 [Raspberry Pi OS Lite](https://downloads.raspberrypi.com/raspios_lite_arm64/images/raspios_lite_arm64-2024-07-04/)
  - Release: 2024-07-04 (July 4th 2024)
  - Based on: Debian 12 (Bookworm)
- 🅰 Ansible
- 🐋 Docker
- 🎵 PipeWire - Audio/video server (from Debian Bullseye backports)
- 🔊 WirePlumber - Session/policy manager for PipeWire
- 🎬 GStreamer - Multimedia framework for RTP streaming

## Expectations

The freshly created image is located in `dist` folder and i called `distro.img` by default:

```
.
└── dist/
    ├── distro.qcow2
    ├── distro.img    <-- the output bootable image
    └── kernel.img
```

You are free to use you software of choice (for example [`balenaEtcher`](https://etcher.balena.io/) or [`Pi Imager`](https://www.raspberrypi.com/software/)) or any other way (for example with `dd` or using [`Gnome Disk`](https://apps.gnome.org/DiskUtility/)) to flash the `distro.img` file.
