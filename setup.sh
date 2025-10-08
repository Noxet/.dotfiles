set -e


install_zsh()
{
	echo "Installing zsh, fzf, Oh my zsh..."
	! type zsh > /dev/null && sudo apt-get install -y zsh
	! type fzf > /dev/null && sudo apt-get install fzf
	[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "Done"

	echo "Copying zsh config..."
	cp zsh/.zshrc ~/.zshrc
	cp zsh/custom/noxet.zsh ~/.oh-my-zsh/custom/noxet.zsh
	echo "Done"
}

install_tmux()
{
	echo "Installing tmux..."
	! type tmux > /dev/null && sudo apt-get -y install tmux
	echo "Done"

	echo "Copying tmux config..."
	cp tmux/.tmux.conf ~/
	echo "Done"
}

install_helix()
{
	if ! type hx
	then
		echo "Installing helix..."
		sudo add-apt-repository ppa:maveonair/helix-editor
		sudo apt update
		sudo apt install helix
		echo "Done"
	fi
	
	echo "Copying helix config..."
	cp helix/config.toml ~/.config/helix
	cp helix/languages.toml ~/.config/helix
	echo "Done"

	echo "Setting up lsp..."
	! type clangd > /dev/null && sudo apt-get -y install clangd
	echo "Done"
}


install_zsh
install_tmux
install_helix
