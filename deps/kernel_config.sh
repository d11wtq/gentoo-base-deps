kernel_config() {
  require eclean_kernel
  require genkernel
  require kernel_sources

  new_config=./deps/kernel_config/config
  old_config=/usr/src/linux/.config
  kernel_img=/usr/src/linux/vmlinux

  is_met() {
    /usr/src/linux/scripts/extract-ikconfig $kernel_img | diff $new_config -
  }

  meet() {
    echolog "Purging existing kernels"
    sudo eclean-kernel -a -d -x build

    echolog "Recompiling linux kernel"
    sudo cp -f $new_config /usr/src/linux/.config
    sudo genkernel \
      --install \
      --symlink \
      --oldconfig \
      --bootloader=grub2 \
      all

    rebuild_vbox_guest_additions
  }

  rebuild_vbox_guest_additions() {
    version=4.3.12
    package=app-emulation/virtualbox-guest-additions

    echolog "Emerging virtualbox-guest-additions"
    sudo emerge =$package-$version --autounmask-write
    sudo etc-update --automode -5
    sudo emerge =$package-$version
  }
}
