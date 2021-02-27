# Defined in - @ line 1
function cdl --wraps='cd && ls' --description 'alias cdl=cd && ls'
  cd && ls $argv;
end
