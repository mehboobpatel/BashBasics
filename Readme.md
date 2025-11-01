🧠 Why do we put variables inside quotes — "$num" — instead of just $num?

In Bash, quoting variables is about safety and predictability.
Without quotes, Bash can misinterpret or split your variable value in unexpected ways.

⚠️ Problem 1: Empty variable values

Suppose you forget to type a number and just hit Enter:

read num
read num2
if [ $num -gt $num2 ]; then
  echo "A is greater"
fi


If $num is empty, Bash expands that line into:

if [ -gt 5 ]; then


💥 Result:

bash: [: -gt: unary operator expected


❌ Bash doesn’t know what to compare — because $num vanished completely.

✅ When you quote it:

if [ "$num" -gt "$num2" ]; then


It expands safely to:

if [ "" -gt "5" ]; then


Now Bash clearly sees both arguments (even if one is empty) and can handle the error gracefully.

⚠️ Problem 2: Spaces in variables

Example:

name="Maheboob Patel"
echo Hello, $name!


This works fine for echo, but imagine:

if [ $name = "Maheboob Patel" ]; then
  echo "Match"
fi


That expands into:

if [ Maheboob Patel = Maheboob Patel ]; then


Bash splits it into 4 separate arguments → ❌ syntax error.

✅ With quotes:

if [ "$name" = "Maheboob Patel" ]; then


That expands to:

if [ "Maheboob Patel" = "Maheboob Patel" ]; then


Perfect and safe ✅

⚠️ Problem 3: Special characters

If the variable contains *, ?, or !, Bash might interpret them as wildcards or history expansion.

Example:

file="*.txt"
echo $file    # Expands to all matching filenames in current directory!
echo "$file"  # Prints literally "*.txt"

---------

![alt text](/screenshots/filedesc.png)

Important: &1>file is wrong

&1> is not valid.

Bash gets confused because it sees & but doesn’t know what to do.

Always use 2>&1 or &> (shorthand for 2>&1) for combining outputs.

#Here, the ampersand (&) tells Bash that what follows is a file descriptor number, not a filename.
🧩 1. When & is at the end of a command
long_running_command &
Run the command in the background.

So your shell:

starts the command,

immediately gives you your prompt back (you can type other things),

doesn’t wait for the command to finish.

![datestdout](screenshots/datestdout.png)

you can use this command to work  date | xargs -I{} echo "Today is {}"
Today is Sat Nov  1 17:14:49 UTC 2025
maddy@Maheboob:~/bash$ 

without use set -e your script will execute rest of the commands if there there is an error
like below ss, by using set -e you are telling that exit even if command has error
![alt text](/screenshots/image.png)

The drawback of set -e is that IF THERE IS A PIPE OPERATOR COMMAND it will check for the last command in the line if its valid than it will still execute the whole script rest commands 
IF THE LAST COMMAND IS NOT VALID in the pipe operator it THAN ONLY THROW ERROR
below you 

see though the bakuisland threw error still the last echo command got executed of this passed
![alt text](/screenshots/image-1.png)

now letes add a hawaiisland error command 

![alt text](/screenshots/image-2.png)

see it threw error

so to avoid id we use set -o pipefall

now lets go back to the first where there was just bakuisland example

here is even if any command in the pipeoperator fails the whole scripts exits
![alt text](/screenshots/image-3.png)

![file operators checking cheatsheet](/screenshots/image-4.png)

| Operator    | Checks                                 | Example                                         |
| ----------- | -------------------------------------- | ----------------------------------------------- |
| `-f file`   | File exists **and is a regular file**  | `[ -f "file1.txt" ] && echo "Regular file"`     |
| `-d file`   | File exists **and is a directory**     | `[ -d "/tmp" ] && echo "Directory exists"`      |
| `-e file`   | File exists **any type**               | `[ -e "file1.txt" ] && echo "File exists"`      |
| `-r file`   | File exists **and is readable**        | `[ -r "file1.txt" ] && echo "Readable"`         |
| `-w file`   | File exists **and is writable**        | `[ -w "file1.txt" ] && echo "Writable"`         |
| `-x file`   | File exists **and is executable**      | `[ -x "script.sh" ] && echo "Executable"`       |
| `-s file`   | File exists **and is non-empty**       | `[ -s "file1.txt" ] && echo "Not empty"`        |
| `-L file`   | File exists **and is a symbolic link** | `[ -L "link1" ] && echo "Symbolic link"`        |
| `! -e file` | File **does not exist**                | `[ ! -e "file1.txt" ] && echo "Does not exist"` |


NOW COMES TRAP COMMAND
trap.sh you can refer
we use it to perform certain actions when there is a signal like ctrl +c(SIGINT) or kill command (SIGKILL) or SIGTERM or EXIT

QUEST1 script is 
for printing numbers who are divisible by 6 or divisible by 10 and NOT DIVISIBLE by 20

QUEST2
for printing numbers of "s" occurence in a given word