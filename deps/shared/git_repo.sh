git_repo() {
  src=$1
  dst=$2

  echolog "$src -> $dst"

  is_met() {
    [[ -d $dst ]]
  }

  meet() {
    echolog "Cloning $src"
    GIT_SSH=$p/git_repo/git_ssh.sh git clone $src $dst
  }
}
