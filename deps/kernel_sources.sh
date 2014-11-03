kernel_sources() {
  kernel_ver=3.12.21
  pkg_rev=r1
  kernel_src=/usr/src/linux-$kernel_ver-aufs-$pkg_rev

  available() {
    echolog "Checking =sys-kernel/aufs-sources-$kernel_ver-$pkg_rev"

    is_met() {
      equery which =sys-kernel/aufs-sources-$kernel_ver-$pkg_rev
    }

    meet() {
      true
    }
  }

  installed() {
    is_met() {
      [[ -f $kernel_src/Makefile ]]
    }

    meet() {
      echolog "Emerging aufs-sources"
      sudo emerge =sys-kernel/aufs-sources-$kernel_ver-$pkg_rev --autounmask-write
      sudo etc-update --automode -5
      sudo emerge =sys-kernel/aufs-sources-$kernel_ver-$pkg_rev
    }
  }

  symlinked() {
    is_met() {
      [[ `realpath /usr/src/linux` = $kernel_src ]]
    }

    meet() {
      sudo ln -snf $kernel_src /usr/src/linux
    }
  }

  require available
  require installed
  require symlinked
}
