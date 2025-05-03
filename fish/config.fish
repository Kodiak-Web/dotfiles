babelfish < ~/.nix-profile/etc/profile.d/hm-session-vars.sh | builtin source
	
if status is-interactive
zoxide init fish | source
    # Commands to run in interactive sessions can go here
end

function ! 
	history | head $argv
end
