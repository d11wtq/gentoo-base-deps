hostname() {
  if [[ -z $PROVISION_HOSTNAME ]]
  then
    PROVISION_HOSTNAME=gentoo
  fi

  name=$PROVISION_HOSTNAME

  startup() {
    file=/etc/conf.d/hostname

    is_met() {
      [[ `hostname` = $name ]]
    }

    meet() {
      sudo sed -i "s/hostname=.*/hostname=\"$name\"/" $file
      sudo /etc/init.d/hostname restart
    }
  }

  hosts_file() {
    file=/etc/hosts

    is_met() {
      match "127.0.0.1" && match "::1"
    }

    meet() {
      sudo sed -i "/\\b$name\\b/d" $file
      sudo sh -c "echo -e '127.0.0.1\t$name' >> $file"
      sudo sh -c "echo -e '::1\t\t$name'     >> $file"
    }

    match() {
      grep -E "\\s+$name\\b" $file | grep -F "$1"
    }
  }

  require startup
  require hosts_file
}
