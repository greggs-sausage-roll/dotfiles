function ms --wraps='curl -s https://am.i.mullvad.net/json | jq' --description 'alias ms=curl -s https://am.i.mullvad.net/json | jq'
  curl -s https://am.i.mullvad.net/json | jq $argv
        
end
