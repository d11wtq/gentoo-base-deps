bashrc() {
  new_bashrc=$p/bashrc/.bashrc
  old_bashrc=~/.bashrc

  is_met() {
    diff $old_bashrc $new_bashrc
  }

  meet() {
    cp -f $new_bashrc $old_bashrc
  }
}
