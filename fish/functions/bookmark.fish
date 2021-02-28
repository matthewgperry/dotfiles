# Defined in - @ line 1
function bookmark --wraps='bash bookmark' --wraps='bash ./Projects/Programming/shell/bookmark.sh' --wraps='bash .~/Projects/Programming/shell/bookmark.sh' --wraps='bash .matt/home/Projects/Programming/shell/bookmark.sh' --description 'alias bookmark bash .matt/home/Projects/Programming/shell/bookmark.sh'
  bash .matt/home/Projects/Programming/shell/bookmark.sh $argv;
end
