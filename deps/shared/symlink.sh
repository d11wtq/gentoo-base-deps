symlink() {
  dst=$2
  src=$1

  log "$src -> $dst"

  is_met() {
    [[ `readlink $src` = $dst ]]
  }

  meet() {
    ln -snf $dst $src
  }
}
