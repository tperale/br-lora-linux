# lora-linux

Buildroot repositoy to compile the 2018 Linux Kernel [LoRa network stack proposal](https://elinux.org/images/1/1b/A-Sockets-API-for-LoRa-Andreas-F%C3%A4rber-SUSE-1.pdf)
for beaglebone board.

The source are available at [kernel.org/afaerber/linux-lora](https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-lora.git/log/?h=lora-next)
but a linux fork with the patch applied to different kernel version is
available on github at [tperale/linux](https://github.com/tperale/linux).

## Building

```shell
make beaglebone_lora
```
