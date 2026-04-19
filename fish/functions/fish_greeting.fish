function fish_greeting
    if command -q fortune
        if command -q cowsay
            fortune | cowsay -r
        else
            fortune
        end
		else
				echo "Welcome back 👋"
    end
end
