group() {
  gid=$1
  uid=$2

  if [[ -z $uid ]]
  then
    uid=$(whoami)
  fi

  log "$@"

  is_met() {
    [[ `groups $uid` =~ $gid ]]
  }

  meet() {
    sudo usermod -aG $gid $uid
  }
}
