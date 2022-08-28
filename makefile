all: neovim bash

neovim:
	stow --verbose --target=$$HOME --restow neovim/
bash:
	stow --verbose --target=$$HOME --restow bash/

# delete:
#         stow --verbose --target=$$HOME --delete neovim/
#         stow --verbose --target=$$HOME --delete bash/
