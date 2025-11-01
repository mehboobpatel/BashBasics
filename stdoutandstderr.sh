#!/bin/bash
{
  echo "This is normal output" 
  ls /no/asdf 
}  2>&1 > few.txt

#Since stdout (1) is the default, Bash lets you omit the 1.
#Bash processes redirections in order, from left to right, at the moment it sees them.
#This says:

# “Redirect the stderr bucket (2) into wherever stdout (1) is currently going.”

# At this moment:

# stdout (1) → still going to your terminal (screen)

# stderr (2) → gets redirected to that same place (the terminal)

# ✅ So now:

# stdout → terminal

# stderr → terminal

# (both are pointing to the terminal for now)
# 🥈 Step 2 — > few.txt

# Now we say:

# “Redirect stdout (1) to few.txt.”

# So after this step:

# stdout → few.txt

# stderr → still goes where it was before (the terminal)

# ⚠️ stderr does not automatically “follow” stdout; it only copied stdout’s destination at the time of 2>&1 — and at that time, stdout was still pointing at the terminal.