kernel_config() {
  require eclean_kernel
  require genkernel
  require kernel_sources

  new_config=$p/kernel_config/config
  old_config=/usr/src/linux/.config
  kernel_img=/usr/src/linux/vmlinux

  is_met() {
    /usr/src/linux/scripts/extract-ikconfig $kernel_img | diff $new_config -
  }

  meet() {
    log "Purging existing kernels"
    sudo eclean-kernel -a -d -x build

    log "Recompiling linux kernel"
    sudo cp -f $new_config /usr/src/linux/.config
    sudo genkernel \
      --install \
      --symlink \
      --oldconfig \
      --bootloader=grub2 \
      all

    log "Rebuilding kernel modules"
    sudo emerge -1 @module-rebuild
  }
}
