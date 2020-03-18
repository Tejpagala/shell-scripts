## printf and echo commands can be used to print the output.

# echo used case

echo "Hello "

# echo with escape sequences

# \n - new line
# \t - new tab
# \e - new color

## echo with new line 

echo -e "Hello\nTeja"

# echo with tab space 

echo -e "Hello\t\tWorld"

## To print output with colors, we have to use this color code.

## color         ForeGround       BackGround

# Red             31                   41
# Green           32                   42
# yellow          33                   43
# Blue            34                   44
# magenta         35                   45
# cyan            36                   46

# syntax for printing color

# echo -e "\e[colorcodem message"

echo -e "\e[35m Hello Teja in magenta color"