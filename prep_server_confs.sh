#!/usr/bin/env bash
{
        echo '# avoid duplicates..                                                          '
        echo 'export HISTCONTROL=ignoredups:erasedups                                       '
        echo '                                                                              '
        echo '# append history entries..                                                    '
        echo 'shopt -s histappend                                                           '
        echo '                                                                              '
        echo '# After each command, save and reload history                                 '  
        echo 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"   '
} >> ~/.bashrc







