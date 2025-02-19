#!/bin/fish

set --universal --export FZF_DEFAULT_OPTS '
  --color=bg:-1,bg+:#363646,fg:-1,fg+:#8992a7,hl:#8992a7,hl+:#b98d7b
  --color=header:#87a987,info:#6A9589,pointer:#FF9E3B
  --color=marker:#FF9E3B,prompt:#DCA561,spinner:#6A9589
  --border-label=" ARCH BTW " --border-label-pos="0" 
  --preview-window="border-bold" --padding="0" --prompt=" 𝝺 " --marker="->"
  --pointer="◆" --separator="." --scrollbar="|" --info="right"
  --bind "ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)"
  --preview="bat --color=always --style=numbers {}"'
