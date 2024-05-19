export VAULT_ADDR=https://vault.services.opendoor.com:8200
export GOPATH="$HOME/go"

if status is-interactive
    # Commands to run in interactive sessions can go here
    export PATH="/Users/john.cantrellopendoor.com/Library/Python/3.9/bin:$PATH"
    source ~/.asdf/asdf.fish
    export PATH="$PATH:$(yarn global bin)"
    eval "$(direnv hook fish)"
    starship init fish | source

    alias vim="nvim"
    alias vi="nvim"

    alias rg="rg -S"

    # either open up the current branch's pr or open the create pr page in github
    function pr
        gh pr view $(git rev-parse --abbrev-ref HEAD) -w
        if test $status -eq 0
            echo "Done"
        else
            echo "Creating new pr..."
            gh pr create -w
        end
    end

    # list all my PRs and the urls to view them in github
    function lspr
        gh pr list --json number,headRefName,url --template \
"{{range .}}
{{(.headRefName | autocolor \"white+b\")}} 
  {{.url}}{{end}}" \
      --author "@me"  $argv
    end


######### od shell tooling #########
# these lines added by `code/scripts/development/maybe_install_od_shell_tooling.sh`
set OD_CODE_ROOT "/Users/john.cantrellopendoor.com/go/src/github.com/opendoor-labs/code"
set OD_TOOL_SOURCE_SCRIPT "$OD_CODE_ROOT/scripts/infra/sourced_on_shell_load.fish"
[ -f "$OD_TOOL_SOURCE_SCRIPT" ] && source "$OD_TOOL_SOURCE_SCRIPT"
######### end of od shell tooling #########


direnv hook fish | source
zoxide init fish | source

end
