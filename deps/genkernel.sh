genkernel() {
  is_met() {
    which genkernel
  }

  meet() {
    echolog "Emerging genkernel"
    sudo emerge sys-kernel/genkernel
  }
}
