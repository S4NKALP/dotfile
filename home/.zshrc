
#--------------------------------------------------------------------------------
#	▒███████▒  ██████  ██░ ██     ▄████▄   ▒█████   ███▄    █   █████▒██▓  ▄████ 
#	▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒   ▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █ ▓██   ▒▓██▒ ██▒ ▀█▒
#	░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░   ▒▓█    ▄ ▒██░  ██▒▓██  ▀█ ██▒▒████ ░▒██▒▒██░▄▄▄░
#	  ▄▀▒   ░  ▒   ██▒░▓█ ░██    ▒▓▓▄ ▄██▒▒██   ██░▓██▒  ▐▌██▒░▓█▒  ░░██░░▓█  ██▓
#	▒███████▒▒██████▒▒░▓█▒░██▓   ▒ ▓███▀ ░░ ████▓▒░▒██░   ▓██░░▒█░   ░██░░▒▓███▀▒
#	░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒   ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒ ░   ░▓   ░▒   ▒ 
#	░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░     ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░      ▒ ░  ░   ░ 
#	░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░   ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░    ▒ ░░ ░   ░ 
#	  ░ ░          ░   ░  ░  ░   ░ ░          ░ ░           ░         ░        ░ 
#	░                            ░                                               
#--------------------------------By: @S4NKALP-------------------------------------

###############################
# ****** VARS SECTION ****** #
###############################

export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_FONT_DPI="116 Dosis"

export SUDO_PROMPT='PASS: '
export SUDO_ASKPASS="$HOME/.config/rofi/bin/askpass"

export VISUAL='geany'
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export HISTORY_IGNORE="(ls|ll|l|la|lr|lt|cd|pwd|exit|sudo reboot|history|cd -|cd.. |..)"

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin/fun" ] ; 
  then PATH="$HOME/.local/bin/fun:$PATH"
fi

###############################
# ****** LOADING ENGINE SECTION ****** #
###############################

autoload -U compinit     # completion
autoload -U terminfo     # terminfo keys
zmodload -i zsh/complist # menu completion
autoload -U promptinit   # prompt

autoload -U up-line-or-beginning-search; zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search; zle -N down-line-or-beginning-search

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)
ENABLE_CORRECTION="true"

zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-min-height 100
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*:corrections' format ' %F{green}->%F{green} %d: %e%f'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=36=0=01'
zstyle ':completion:*:messages' format ' %F{green}->%F{purple} %d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:manuals' separate-sections true


###############################
# ****** WAITING DOTS ****** #
###############################

expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

###############################
# ****** HISTORY SECTION ****** #
###############################

HISTFILE=~/.config/zsh/zhistory
HISTSIZE=10000
SAVEHIST=10000

###############################
# ****** ZSH COOL SECTION ****** #
###############################

setopt AUTOCD             
setopt PROMPT_SUBST      
setopt MENU_COMPLETE       
setopt LIST_PACKED	   
setopt AUTO_LIST           
setopt HIST_IGNORE_DUPS	   
setopt HIST_FIND_NO_DUPS   
setopt COMPLETE_IN_WORD    
setopt nobeep 	   	   
setopt histignorealldups   
setopt appendhistory       
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt CORRECT
setopt NO_NOMATCH
setopt LIST_PACKED
setopt ALWAYS_TO_END
setopt GLOB_COMPLETE
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt AUTO_CONTINUE
setopt LONG_LIST_JOBS

###############################
# ****** PROMPT SECTION ****** #
###############################

function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{black}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}

PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '

###############################
# ****** PLUGIN SECTION ****** #
###############################

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/fzf/key-bindings.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4C566A,underline"
CASE_SENSITIVE="false"

###############################
# ****** KEYBINDING SECTION ****** #
###############################

bindkey -e

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M viins "^[[3~" delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M emacs "^[3;5~" delete-char
  bindkey -M viins "^[3;5~" delete-char
  bindkey -M vicmd "^[3;5~" delete-char
fi

typeset -g -A key
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Control Left - go back a word
key[Control-Left]="${terminfo[kLFT5]}"
if [[ -n "${key[Control-Left]}"  ]]; then
	bindkey -M emacs "${key[Control-Left]}"  backward-word
	bindkey -M viins "${key[Control-Left]}"  backward-word
	bindkey -M vicmd "${key[Control-Left]}"  backward-word
fi

# Control Left - go forward a word
key[Control-Right]="${terminfo[kRIT5]}"
if [[ -n "${key[Control-Right]}" ]]; then
	bindkey -M emacs "${key[Control-Right]}" forward-word
	bindkey -M viins "${key[Control-Right]}" forward-word
	bindkey -M vicmd "${key[Control-Right]}" forward-word
fi

# Alt Left - go back a word
key[Alt-Left]="${terminfo[kLFT3]}"
if [[ -n "${key[Alt-Left]}"  ]]; then
	bindkey -M emacs "${key[Alt-Left]}"  backward-word
	bindkey -M viins "${key[Alt-Left]}"  backward-word
	bindkey -M vicmd "${key[Alt-Left]}"  backward-word
fi

# Control Right - go forward a word
key[Alt-Right]="${terminfo[kRIT3]}"
if [[ -n "${key[Alt-Right]}" ]]; then
	bindkey -M emacs "${key[Alt-Right]}" forward-word
	bindkey -M viins "${key[Alt-Right]}" forward-word
	bindkey -M vicmd "${key[Alt-Right]}" forward-word
fi

###############################
# ****** TERM TITLE ****** #
###############################

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (kitty*|alacritty*|termite*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi


###############################
# ****** ALIAS SECTION ****** #
###############################


alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias maintenace="yay -Sc && sudo pacman -Scc"
alias update="paru -Syu --nocombinedupgrade"
alias sync="sudo pacman -Syyy"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias vm-on="sudo systemctl start libvirtd.service"
alias vm-off="sudo systemctl stop libvirtd.service"
alias musics="ncmpcpp"
alias youtube="ytfzf -t"
alias clearcache="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias myip="curl http://ipecho.net/plain; echo"
alias q="exit"
alias c="clear -x"
alias la='ls -lAFh '   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias gcl='git clone --depth 1'
alias init='git init'
alias add='git add'
alias commit='git commit -m'
alias push='git push origin main'
alias check='git checkout'
alias h='history'
alias delete='rm'
alias del='sudo rm'
alias delf='sudo rm -rf'
alias delete-f='rm -rf'
alias mtar='tar -zcvf' # mtar <archive_compress>
alias utar='tar -zxvf' # utar <archive_decompress> <file_list>
alias z='zip -r' # z <archive_compress> <file_list>
alias uz='unzip' # uz <archive_decompress> -d <dir>
alias ..='cd ..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias py="python"
alias wifi="nmtui-connect"
alias paci="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias yayi="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias fm='ranger'
alias dun='killall dunst && dunst &
notify-send "cool1" "yeah it is working"
notify-send "cool2" "yeah it is working"'
alias update-fonts='sudo fc-cache -fv'
alias wget="wget -c"
alias archlinux-fix="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"
alias manga='manga-cli'

###############################
# ****** AUTOSTART ****** #
###############################

$HOME/.local/bin/colorscript -r





alias vim=nvim
