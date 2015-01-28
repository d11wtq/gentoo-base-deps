# Custom ~/.bashrc for https://github.com/d11wtq/gentoo-base-deps

# don't run for non-interactive bash
if [[ $- != *i* ]]
then
  return
fi

# path to .bashrc.d files
rc_dir=~/.bashrc.d

# load other .bashrc files
if [[ -d $rc_dir ]]
then
  for rc in $(ls $rc_dir)
  do
    source $rc_dir/$rc
  done
fi

# prevent insanity
export EDITOR=vim

# set the locale sanely
export LC_ALL=en_US.UTF-8

# set the language
export LANG=$LC_ALL

# provide git completion
source ~/.git-completion.bash
