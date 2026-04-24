function fish_greeting
	if command -q fortune
	  if command -q cowsay
			if command -q lolcat
				fortune -s | cowsay -f $(printf "%s\n" default tux kitty bud-frogs cower llama moose sus | shuf -n 1) | lolcat
			else
				fortune -s | cowsay -f $(printf "%s\n" default tux kitty bud-frogs cower llama moose sus | shuf -n 1) 
			end
    else
    	fortune
    end
	else
		echo "Welcome back 👋"
	end
end
