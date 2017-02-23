function fish_prompt
	set_color 729FCF 
    echo -n ' '
    echo -n (basename $PWD)
    set_color normal
    echo -n ' ) '
end
