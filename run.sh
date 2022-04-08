#!/bin/bash


echo "==============================="
echo "|      Getting VIM ready      |"
echo "==============================="
if ! command -v vim &> /dev/null
then 
	echo -n "[+] Installing vim..."
	sudo apt-get install vim -y
	echo "Done!"
fi
	
	
if [[ ! -d ~/.vim/bundle/Vundle.vim ]] 
then 
	echo -n "[+] Installing Vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  > /dev/null 2>&1
	echo "Done!"
fi

echo -n "[+] Copying vim configs..."
mv ~/.vimrc ~/.vimrc.k.bak
cp .vimrc ~
echo "Done!"

echo -n "[+] Installing plugins..."
vim +PluginInstall +qall
echo "Done!"


