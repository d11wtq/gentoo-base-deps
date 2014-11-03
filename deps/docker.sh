docker() {
  installed() {
    pkg_ver=1.3.1
    pkg_name=app-emulation/docker

    is_met() {
      which docker && docker -v | grep $pkg_ver
    }

    meet() {
      echolog "Emerging docker"
      sudo USE=aufs emerge =$pkg_name-$pkg_ver --autounmask-write
      sudo etc-update --automode -5
      sudo USE=aufs emerge =$pkg_name-$pkg_ver
    }
  }

  rc() {
    require runlevel docker default
  }

  groups() {
    require group docker
  }

  require installed
  require rc
  require groups
}
