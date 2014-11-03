git_repo() {
  src=$1
  dst=$2

  log "$src -> $dst"

  is_met() {
    [[ -d $dst ]]
  }

  meet() {
    log "Cloning $src"
    GIT_SSH=$p/git_repo/git_ssh.sh git clone $src $dst
  }
}
