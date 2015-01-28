bashrc() {
  rc_file() {
    new_bashrc=$p/bashrc/.bashrc
    old_bashrc=~/.bashrc

    is_met() {
      diff $old_bashrc $new_bashrc
    }

    meet() {
      cp -f $new_bashrc $old_bashrc
    }
  }

  rc_dir() {
    target_path=~/.bashrc.d

    is_met() {
      [[ -d $target_path ]]
    }

    meet() {
      mkdir -p $target_path
    }
  }

  require rc_file
  require rc_dir
}
