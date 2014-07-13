gentoolkit() {
  is_met() {
    [[ -x `which equery` ]]
  }

  meet() {
    echolog "Emerging gentoolkit"
    sudo emerge app-portage/gentoolkit
  }
}
