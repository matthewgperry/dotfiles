if status --is-interactive

  # Load the SSH environment variables
  if test -f ~/.ssh/environment
    source ~/.ssh/environment
  end

  # Check the environment variables are present
  if test \( "$SSH_AGENT_PID" != "" \) -a \( "$SSH_AUTH_SOCK" != "" \) -a \( -S "$SSH_AUTH_SOCK" \)
    # Check it's not pointing at GNOME askpass
    if string match -rv "/run/user/.*" "$SSH_AUTH_SOCK" >/dev/null
      # Check the agent's actually running
      if ps -p "$SSH_AGENT_PID" >/dev/null
        set -e SSH_ASKPASS
        echo "Found running ssh-agent"
        exit
      end
    end
  end

  # If we get this far, something is wrong
  # Kill the existing agent process if possible
  if test "$SSH_AGENT_PID" != ""
    kill -s TERM "$SSH_AGENT_PID" 2>/dev/null
  end
  
  # Start up a new agent, set the environment variables, and store them
  # in the file for other shell instances
  set a (ssh-agent) >/dev/null
  set s (string match -r '.*=[^;]*' $a)
  rm ~/.ssh/environment 2> /dev/null
  for l in $s
    set v (string replace -r '=' ' ' $l)
    eval "set -x" $v 
    echo "set -x " $v >> ~/.ssh/environment
  end
  echo "Started new ssh-agent"
end
