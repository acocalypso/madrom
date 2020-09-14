# madrom-s905w

This repo contains modifications of Khadas source for amlogic s905w (mainly a95x f1 and x96 mini).


Requirements:
Build Tools -> linaro (gcc 4.9.4)

clone khadas repo:

```repo init --depth=1 -u https://github.com/khadas/android_manifest.git -b Nougat
repo sync -j4
```

clone this repo and override khadas source

s905w Build uboot:
```
export PATH=$PATH:/opt/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-elf/bin/
make CROSS_COMPILE=aarch64-elf- gxl_p281_v1_defconfig
make CROSS_COMPILE=aarch64-elf-
```

s912 Build uboot:
```
export PATH=$PATH:/opt/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-elf/bin/
make CROSS_COMPILE=aarch64-elf- gxb_p201_v1_defconfig
make CROSS_COMPILE=aarch64-elf-
```

build madrom s905w

```
export LC_ALL=C // needed in case of segfault issue
source build/envsetup.sh
lunch 9 (userdebug-64)
make -j4 otapackage
```

build madrom s905w

```
export LC_ALL=C // needed in case of segfault issue
source build/envsetup.sh
lunch 12 (userdebug-64)
make -j4 otapackage
```

if jack build failes with heap memory aborted:

```
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server
```

Now you need to replace the uboot chain with the original one (x96 / a95)

- Unpack the stock rom with AML Tool 6.0.0 (Only Level 1)
- Unpack the madrom to level 1 (keep aml tools open !)
- Move _aml_dtb.PARTITION, aml_sdc_burn.UBOOT, bootloader.PARTITION, DDR.USB, UBOOT.USB from Stock to madrom.
- Inject TWRP
- Repack madrom

ToDo:
- add Wifi
- polish readme
- otaupdate???
- include twrp in build chain


