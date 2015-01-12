vim() {
  is_met() {
    vim --version | grep -F 7.4
  }

  meet() {
    sudo emerge =app-editors/vim-7.4.273
  }
}
