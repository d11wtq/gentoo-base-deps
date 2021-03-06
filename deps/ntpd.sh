ntpd() {
  installed() {
    is_met() {
      [[ -x /usr/sbin/ntpd ]]
    }

    meet() {
      log "Emerging ntp"
      sudo emerge net-misc/ntp
    }
  }

  configured() {
    new_config=$p/ntpd/ntp.conf
    old_config=/etc/ntp.conf

    is_met() {
      diff $new_config $old_config
    }

    meet() {
      sudo cp -f $new_config $old_config
    }
  }

  rc() {
    require runlevel ntpd default
  }

  require installed
  require configured
  require rc
}
