git() {
  libexec_path() {
    re='s/.* in \x27([^ ]+)\x27.*/\1/'
    git help -a | grep "git commands in" | perl -pe "$re"
  }

  has_https() {
    ls "$(libexec_path)/git-remote-https" >/dev/null 2>&1
  }

  installed() {
    is_met() {
      which git && has_https
    }

    meet() {
      sudo USE="curl" emerge dev-vcs/git
    }
  }

  custom_commands() {
    git_ff() {
      script=$p/git/git-ff

      is_met() {
        which git-ff && diff `which git-ff` $script
      }

      meet() {
        sudo mkdir -p /usr/local/bin
        sudo cp -f $script /usr/local/bin/
      }
    }

    require git_ff
  }

  completion() {
    new_script=$p/git/git-completion.bash
    old_script=~/.git-completion.bash

    is_met() {
      diff $new_script $old_script
    }

    meet() {
      cp -f $new_script $old_script
    }
  }

  require installed
  require custom_commands
  require completion
}
