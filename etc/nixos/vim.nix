with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
      if filereadable($HOME . "/.vimrc")
                  source ~/.vimrc
                endif
    '';
    vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
    vimrcConfig.vam.pluginDictionaries = [
        { names = [
            "vundle"
            "youcompleteme"
        ]; }
    ];
} 
