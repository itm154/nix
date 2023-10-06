{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      alias rp="cd ~/Repository/"
      alias dl="cd ~/Downloads/"
      alias docs="cd ~/Documents/"
      alias vim="nvim"
      alias emacs="emacsclient -c -a 'emacs'"
      alias nvimrc="cd $HOME/.config/nvim/lua/custom/ && nvim ."
      alias hyprc="cd $HOME/.config/hypr/ && nvim $HOME/.config/hypr/"
      alias mixer="alsamixer --no-color"
      alias gsettings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
      alias :q="exit"

      alias ls="exa -al --color=always --group-directories-first"
      alias la="exa -a --color=always --group-directories-first"
      alias ll="exa -l --color=always --group-directories-first"
      alias lt="exa -aT --color=always --group-directories-first"
      alias l.="exa -a | egrep "^\.""

      alias grep='grep --color=auto'
      alias egrep='egrep --color=auto'
      alias fgrep='fgrep --color=auto'

      alias venv-activate='source ./bin/activate.fish'

      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
    '';
  };
}
