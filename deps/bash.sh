bash() {
  pkg_patch=52
  pkg_ver=4.2
  pkg_name=app-shells/bash

  is_met() {
    bash --version | grep ${pkg_ver}.${pkg_patch}
  }

  meet() {
    echolog "Emerging bash"
    sudo emerge =app-shells/bash-${pkg_ver}_p${pkg_patch}
  }
}
