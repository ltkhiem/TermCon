#!/bin/bash


echo "==============================="
echo "|      Getting VIM ready      |"
echo "==============================="
if ! command -v vim &> /dev/null
then 
	echo -n "[+] Installing vim..."
	if [[ "$OSTYPE" == "darwin"* ]]
	then
		brew install vim 
		brew link vim
	else
		sudo add-apt-repository ppa:jonathonf/vim -y &> /dev/null
		sudo apt-get install vim -y &> /dev/null
	fi
	echo "Done!"
fi
	

if [[ ! -d ~/.vim/bundle/Vundle.vim ]] 
then 
	echo -n "[+] Installing Vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  > /dev/null 2>&1
	echo "Done!"
fi



echo -n "[+] Copying vim configs..."
if [[ -f ~/.vimrc ]]
then 
	mv ~/.vimrc ~/.vimrc.k.bak
fi

ln -sf ~/TermCon/.vimrc ~/.vimrc

vim_version=$(vim --version | head -1 | grep -o '[0-9]\.[0-9]')
if [ $(echo "$vim_version < 8.2" | bc -l) ] 
then 
	p1s="\"colorscheme dracula"
	p1r="colorscheme gruvbox"
	p2s="autocmd vimenter \* ++nested colorscheme gruvbox"
	p2r="\"autocmd vimenter \* ++nested colorscheme gruvbox"
	if [[ "$OSTYPE" == "darwin"* ]]
	then
		sed -i ".k.tmp" "s/$p1s/$p1r/ ; s/$p2s/$p2r/" ~/.vimrc
		rm ~/.vimrc.k.tmp
	else
		sed -i "s/$p1s/$p1r/ ; s/$p2s/$p2r/" ~/.vimrc
	fi
fi
echo "Done!"


echo -n "[+] Installing plugins..."
vim +PluginInstall +qall
echo "Done!"


