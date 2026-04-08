#  export PATH=$HOME/Library/Python/3.9/bin:$PATH Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Path to your Oh My Zsh installation.
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export ZSH="$HOME/.oh-my-zsh"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_HOME="$HOME/Library/Android/sdk/"
export ANDROID_NDK_HOME="$HOME/Library/Android/sdk/ndk/4.8.0"
export NDK_PATH="$HOME/Library/Android/sdk/ndk/4.8.0"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="$HOME/.sdkman/candidates/java/current" # Temporary change to debug toolchain
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/29.0.2:$PATH
export PATH=$PATH:$HOME/Library/Android/sdk/cmake/3.10.2.4988404/bin
export PATH=$PATH:$HOME/Library/Android/sdk/ndk/4.8.0/toolchains/llvm/prebuilt/darwin-x86_64/bin
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH='/usr/local/mysql/bin':$PATH
export PATH='/usr/local/go/bin':$PATH
export artifactory_contextUrl=http://ci.intranet.v-key.com/artifactory/libs-snapshot-local
export artifactory_user=
export artifactory_password=
ZSH_THEME="powerlevel10k/powerlevel10k"

# ── Claude Code Color Scheme ────────────────────────────

# zsh-autosuggestions: muted tone matching Neovim line numbers
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6b655f"

# LS_COLORS: directories in Claude orange, files in warm tones
export LS_COLORS="di=1;38;2;193;95;60:ln=38;2;86;182;194:ex=38;2;152;195;121:fi=38;2;196;165;132:*.md=38;2;97;175;239:*.json=38;2;212;168;67:*.yaml=38;2;212;168;67:*.yml=38;2;212;168;67:*.toml=38;2;212;168;67:*.lua=38;2;86;182;194:*.py=38;2;212;168;67:*.js=38;2;212;168;67:*.ts=38;2;97;175;239:*.rs=38;2;230;125;34:*.go=38;2;86;182;194:*.sh=38;2;152;195;121:*.css=38;2;198;120;221:*.html=38;2;230;125;34:*.jpg=38;2;224;108;117:*.png=38;2;224;108;117:*.gif=38;2;224;108;117:*.svg=38;2;224;108;117:*.zip=38;2;224;108;154:*.tar=38;2;224;108;154:*.gz=38;2;224;108;154"

# fzf: warm dark background with Claude orange highlights
export FZF_DEFAULT_OPTS="
  --color=bg+:#242019,bg:#1a1815,fg:#e8e6e3,fg+:#f5f0eb
  --color=hl:#C15F3C,hl+:#E67D22,info:#D4A843,marker:#98C379
  --color=prompt:#C15F3C,spinner:#C678DD,pointer:#C15F3C,header:#61AFEF
  --color=border:#3a352e,label:#c4a584,query:#e8e6e3
  --border=rounded
  --prompt='❯ '
  --pointer='▶'
  --marker='✓'
"

# Completion menu uses LS_COLORS + Claude orange headers
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format $'\e[38;2;193;95;60;1m── %d ──\e[0m'
zstyle ':completion:*:messages' format $'\e[38;2;196;165;132m%d\e[0m'
zstyle ':completion:*:warnings' format $'\e[38;2;224;108;117mNo matches found\e[0m'

# Git prompt indicators (Oh My Zsh git plugin)
ZSH_THEME_GIT_PROMPT_PREFIX="%{$'\e[38;2;193;95;60m'%}(%{$'\e[38;2;230;125;34m'%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$'\e[38;2;193;95;60m'%})%{$'\e[0m'%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$'\e[38;2;224;108;117m'%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$'\e[38;2;152;195;121m'%}✓"

# ── End Claude Code Colors ──────────────────────────────
plugins=(
    git
    zsh-autosuggestions
    fzf-dir-navigator
)
source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias nvim="$HOME/bin/nvim-macos-arm64/bin/nvim"
# Load custom aliases if file exists
#

# Load custom aliases if file exists
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

export CLICOLOR=1
# BSD LSCOLORS: directories=Claude orange bold, symlinks=cyan, exec=green
#               ex Gx cx dx bx eg ed ab ag ac ad
export LSCOLORS="DxGxcxdxCxegedabagacad"

