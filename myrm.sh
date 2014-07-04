#!/bin/bash
if [[ $1 = -*r* ]] && ([[ $2 == /Users/lule* ]]||[[ $2 == ~* ]]) ;then
    # echo -e " \033[31;5m   (╯‵□′)╯︵┻━┻    (╯‵□′)╯︵┻━┻	(╯‵□′)╯︵┻━┻    (╯‵□′)╯︵┻━┻	\033[0m"
    echo -e "\033[31m >_< do not be so stupid!!!pls add ./ \033[31;5m(╯‵□′)╯︵┻━┻\033[0;31m  I am here @ ~/shell/myrm.sh >_< \033[0m"
    # echo "";
else
	echo $@ | xargs rm
	echo -e " \033[32m(•̀ᴗ•́)و ̑̑ welcome use my rm (•̀ᴗ•́)و ̑̑ \033[0m";
	# echo "";
fi