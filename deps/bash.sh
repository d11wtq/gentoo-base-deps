bash() {
  pkg_ver=4.2_p49
  pkg_name=app-shells/bash

  is_met() {
    bash --version | grep $(echo $pkg_ver | sed s/_p/./)
  }

  meet() {
    echolog "Emerging bash"
    sudo emerge =app-shells/bash-$pkg_ver
  }
}
