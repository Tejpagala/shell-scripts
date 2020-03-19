#!/bin/bash

# It is generally called as exit status or exit code

# Exit status is a number which determines the previous executed command is successfully executed or failed.

# exit staus ranges from 0-255
# 0      -> Successful
#1-255   -> Not-successfull / partially successfull
#126     -> permission denied
#127     -> command not found
#128+    ->  system status

# 1 - 125 are preferred to use for users.

# you can get the exit status number from a special variable which is ? , You can access this variable $?

exit 1