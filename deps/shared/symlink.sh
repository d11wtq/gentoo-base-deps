symlink() {
  dst=$2
  src=$1

  echolog "$src -> $dst"

  is_met() {
    [[ `readlink $src` = $dst ]]
  }

  meet() {
    ln -snf $dst $src
  }
}
