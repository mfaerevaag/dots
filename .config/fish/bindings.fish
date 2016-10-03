# .dotfile
# fish - bindings

function _bind_clear -d "clear and greet"
  clear
  fish_greeting
  commandline -f repaint
end

function _bind_git_status -d "git status"
  echo ''
  if git status > /dev/null ^ /dev/null
    git status
  else
    set_color red
    echo "not a git repo!"
    set_color normal
  end
  commandline -f repaint
end

function _bind_ag -d "ag current command"
  set -l cmd ag

  if commandline -j|ag -v "$cmd *\$" >/dev/null
    commandline -aj " | $cmd;"
  end
end

function _bind_new_window -d "ag current command"
  set -l term urxvt

  eval "$term &"
end

function reload! -d "reload configs"
  set_color green
  echo -e "\nreloading configs..."
  set_color normal

  source $FISH/config.fish

  commandline -f repaint
end

function fish_user_key_bindings
  bind \er reload! # reload config
  bind \el 'echo ''; ll; commandline -f repaint;' # ls -l
  bind \eg _bind_ag # ag
  bind \et _bind_new_window # term
  bind \ek _bind_git_status # git status
  bind \cl _bind_clear
end
