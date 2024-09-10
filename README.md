# Central Node 📡
Docker and Ansible configuration for the [Raspberry Pi 4B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/) board with 4G RAM as central node. 🍓

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
Verry simple because the only actually required dependancies are

### 🎮 Bash
Just to run the `setup.sh` script.

### 🐋 Docker
Because everything in this repository (configurations, environments, etc.) is dockerized which makes things easily portable and .

## How to use

Running the `setup.sh` script with your `bash` shell:

```bash
./setup.sh
```

will build the docker containers that will run it's task to create the `*.img` file.

## What is used

- 🍓 [Raspberry Pi OS Lite](https://downloads.raspberrypi.com/raspios_lite_arm64/images/raspios_lite_arm64-2024-07-04/)
  - Realease: 2024-07-04 (July 4th 2024)
  - Based on: Debian 12 (Bookworm)
- ...

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
