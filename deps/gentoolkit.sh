gentoolkit() {
  is_met() {
    [[ -x `which equery` ]]
  }

  meet() {
    log "Emerging gentoolkit"
    sudo emerge app-portage/gentoolkit
  }
}
