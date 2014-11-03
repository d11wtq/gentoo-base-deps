genkernel() {
  is_met() {
    which genkernel
  }

  meet() {
    log "Emerging genkernel"
    sudo emerge sys-kernel/genkernel
  }
}
