docker() {
  installed() {
    pkg_ver=1.4.1
    pkg_name=app-emulation/docker

    is_met() {
      which docker && docker -v | grep $pkg_ver
    }

    meet() {
      log "Emerging docker"
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
