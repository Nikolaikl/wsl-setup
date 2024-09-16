#!/bin/bash

source ./scripts/utils.sh

fonts_dir="$HOME/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
	mkdir -p "$fonts_dir"
fi

declare -a fonts=(
	FiraCode
	RobotMono
	Hack
	JetBrainsMono
)

git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts/

cd nerd-fonts

for font in "${fonts[@]}"; do
	git sparse-checkout add "patched-fonts/${font}"
	./install.sh "${font}"
done

cd ../
rm -rf nerd-fonts
echo_info "Installation of Nerd fonts succesful"
