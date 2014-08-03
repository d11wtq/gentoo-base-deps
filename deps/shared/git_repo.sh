git_repo() {
  src=$1
  dst=$2

  is_met() {
    [[ -d $dst ]]
  }

  meet() {
    GIT_SSH=$p/git_repo/git_ssh.sh git clone $src $dst
  }
}
