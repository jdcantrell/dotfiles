if status is-interactive
    # allow vim on escape
    fish_vi_key_bindings

    /opt/homebrew/bin/brew shellenv | source
    # export PATH="$PATH:$(yarn global bin)"
    fish_add_path ~/.local/bin
    starship init fish | source
    zoxide init fish | source

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


end

# Created by `pipx` on 2024-11-19 22:04:59
set PATH $PATH /Users/jd/.local/bin
