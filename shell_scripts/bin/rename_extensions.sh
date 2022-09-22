#!/bin/bash
read -rp 'Old Extension: ' OLD_EXT
read -rp 'New Extension: ' NEW_EXT


if [ -z "$NEW_EXT" ] && [ -z "$OLD_EXT" ]; then
    echo "Nothing to do"
    exit 1
fi

if [ -z "$NEW_EXT" ];then
    echo "Converting all files having *.$OLD_EXT in $(pwd) to *"
else
    echo "Converting all files having *.$OLD_EXT in $(pwd) to *.$NEW_EXT"
fi

read -p "Are you sure? " -n 1 -r
echo    
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

if [ -z "$OLD_EXT" ]
then
    for file in *; do
        echo Renaming $file to "${file}.$NEW_EXT"
        mv -- "$file" "${file}.$NEW_EXT"
    done
    exit 1
fi

for file in *.$OLD_EXT; do 

    if [ -z "$NEW_EXT" ]
    then
        echo Renaming $file to "${file%.$OLD_EXT}"
        mv -- "$file" "${file%.$OLD_EXT}"
    else
        echo 'Renaming $file to "${file%.$OLD_EXT}.$NEW_EXT"'
        mv -- "$file" "${file%.$OLD_EXT}.$NEW_EXT"
    fi


    if [ -z "$OLD_EXT" ]
    then
        echo Renaming $file to "${file%.$OLD_EXT}"
        mv -- "$file" "${file%.$OLD_EXT}"
    fi
done

