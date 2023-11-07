export ZSH=/usr/share/oh-my-zsh

BULLETTRAIN_PROMPT_ORDER=(
    context
    dir
    git
)

BULLETTRAIN_CONTEXT_DEFAULT_USER=$USER


BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
ZSH_THEME="bullet-train"

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.dotnet/tools:/usr/share/dotnet"

export LLVM_SYS_140_PREFIX="$HOME/dev/pkg/llvm-14.0.6"
