# Bash Scripting

Here are the common code snippets to create bash scripts

## How To

- [do basic math expression][math-exp]
- [create a variable][create-var]
- [create a comment][create-comm]
- [read input][read-inpt]
- [read from a file][read-file]
- [read from arguments][read-args]
- [write to a file][write-file]
- [use conditional statements][con-stat]
- [use loops][looping]
- [lowercase a string][low-case]
- [run a cron on a script][cron-script]

## Errors

- [no such file or directory][no-file]

[cron-script]:#run-a-cron-on-a-script
[low-case]:#lowercase-a-string
[looping]:#use-loops
[con-stat]:#use-conditional-statements
[write-file]:#write-to-a-file
[read-args]:#read-from-arguments
[no-file]:#no-such-file-or-directory
[read-file]:#read-from-a-file
[math-exp]:#do-basic-math-expression
[read-inpt]:#read-input
[create-var]:#create-a-variable
[create-comm]:#create-a-comment
[home]:#bash-scripting

### run a cron on a script

<details>
<summary>
View Content
</summary>

:link: **Reference**

:pencil2: **Things to note**

- [cron jobs in linux](https://www.freecodecamp.org/news/cron-jobs-in-linux/)
---

This is an example of what each asterisk represents in time. It still is confusing as hell

```linux
*   *   *   *   *  sh /path/to/script/script.sh
|   |   |   |   |              |
|   |   |   |   |      Command or Script to Execute        
|   |   |   |   |
|   |   |   |   |
|   |   |   |   |
|   |   |   | Day of the Week(0-6)
|   |   |   |
|   |   | Month of the Year(1-12)
|   |   |
|   | Day of the Month(1-31)  
|   |
| Hour(0-23)  
|
Min(0-59)
```

</details>

[go back :house:][home]

### lowercase a string

<details>
<summary>
View Content
</summary>

:link: **Reference**

:pencil2: **Things to note**

- [How to convert a string to lower case in Bash](https://stackoverflow.com/questions/2264428/how-to-convert-a-string-to-lower-case-in-bash)
---

Here are a couple of options to lowercase

```linux
#!/bin/bash


echo "What is your first name?"

read name

# option 1
echo "$name" | tr '[:upper:]' '[:lower:]'

echo "What is your last name?"

read last
# option 2
echo "$last" | awk '{print tolower($0)}'

echo "What do you want get off your chest"

read chest
# option 3
echo $chest | tr '[A-Z]' '[a-z]'
```

</details>

[go back :house:][home]

### use loops

<details>
<summary>
View Content
</summary>

:link: **Reference**

:pencil2: **Things to note**

- [How do I iterate over a range of numbers defined by variables in Bash?](https://stackoverflow.com/questions/169511/how-do-i-iterate-over-a-range-of-numbers-defined-by-variables-in-bash)

---

This is an example of the while loop

```linux
#!/bin/bash

i=1
# surprisingly the comparison operator flags
# work in these brackets while it loops
while [[ $i -le 10 ]] ; do
   echo "$i"
  (( i += 1 ))
done

```

this is an example of the for loop. In case you wanted to use a defined variable as a part of the looping process. You should use the `seq` command

```linux
#!/bin/bash

max=10

# the seq command allows you to add a variable as either the beginning or end of the for loop
# you can use or you could have a predefined range in the for loop
# like this : for i in {1..5}
for i in $(seq 1 $max)
do
   if test $i -gt 1; then

     echo "$i monkeys"

    else 

      echo "$i monkey"

   fi

done

echo "Are jumping on the bed"

```

</details>

[go back :house:][home]

### use conditional statements

<details>
<summary>
View Content
</summary>

:link: **Reference**

- [Bash Test Operators](https://kapeli.com/cheat_sheets/Bash_Test_Operators.docset/Contents/Resources/Documents/index)

---

This example is using the `case` statement which is similar to the `switch` statement

```linux
#!/bin/bash


echo "What job do you have?"

read job

# this is how you lowercase string values
job=$(echo "$job" | tr '[:upper:]' '[:lower:]')

case $job in 
    "knight")
      echo "Then you should you have a sword"
    ;;

    "mage")
    echo "Then you should have a staff"
    ;;

    "archer")
    echo "Then you should have a bow"
    ;;

    *)
    echo "Sir, we're in a medieval fantasy"
  ;;
esac
```

 This example works only when you place curly brackes around the comparison. I was not able to produce a `-lt` because I would get a lot of errors

```linux
#!/bin/bash

echo "How much do you weigh in pounds?"

read weight

# converts the weight of pounds to kilos
kg=$(bc <<< "$weight/2.2046" )

# the less than operator only works if the comparison is wrapped in two  curly brackets
if (("$weight" < 150));then
 echo "You're pretty skinny for $kg kilos"

 elif (("$weight"  < 180)); then
 echo " That's $kg kilos, seem to be normal weight ... if you're a man"
 else
 echo "You are $kg kilos, you are either slightly chubby or a complete fat ass"

fi

```

This example allows comparison operator flags like `-lt, -ge, -a, or -o` to work. Apparently using the `test` command makes it work properly. There might be other keywords/commands that can make it work, but here is an example . And here is a [link](https://kapeli.com/cheat_sheets/Bash_Test_Operators.docset/Contents/Resources/Documents/index) to the different comparison operators

```linux
#!/bin/bash

echo "How much do you weigh in pounds?"

read weight

# converts the weight of pounds to kilos
kg=$(bc <<< "$weight/2.2046" )

# apparently using the test keyword will allow the -lt to be recognized
if test "$weight" -lt 150 ;then
 echo "You're pretty skinny for $kg kilos"

 elif test "$weight"  -lt 180 ; then
 echo " That's $kg kilos, seem to be normal weight ... if you're a man"
 elif test $weight -ge 200 -o $weight -le 250; then
  echo "$kg kilos!? You are one beefy boy"
 else
 echo "You are $kg kilos, you are either slightly chubby or a complete fat ass"

fi

```



This example does not work because the bash script is giving errors stating that the `-lt` command is not found. I don't know how far I'm going to look into how to resolve this issue

```linux
#!/bin/bash

echo "How much do you weigh in pounds?"

read weight

# converts the weight of pounds to kilos
kg=$(bc <<< "$weight/2.2046" )

# the -lt is the less than operator
if [$weight -lt 150 ];then
 echo "You're pretty skinny for $kg kilos"

 elif [$weight  -lt 180 ]; then
 echo " That's $kg kilos, seem to be normal weight ... if you're a man"
 else
 echo "You are $kg kilos, you are either slightly chubby or a complete fat ass"
# I'm assuming you have to end every if statement with a fi
# more testing is needed
fi

```

</details>

[go back :house:][home]

### write to a file

<details>
<summary>
View Content
</summary>

---

This is an example

```linux
#!/bin/bash

cd "$(dirname "$0")"

# If the file does not exist, it will create the file
# and then insert the text
echo "I'm inserting text into this file" > ../text/t002.txt

# the >> appends text to the file
echo "I'm appending text into this file" >> ../text/t002.txt

```

</details>

[go back :house:][home]

### read from arguments

<details>
<summary>
View Content
</summary>

---

Numbered variables in bash script can indicate the different input values that the script read from. So if you type in 3 separate words, they can be interpreted as 3 different arguments that bash can use as variables. The way you access the arguments is by the sequence of the variable. So if you wanted to get value of the second argument you can call it out like this `echo $2`. And so on.

```linux
# outside of bash

bash scripts/bash007.sh  dog cat fish horse

# inside bash
#!/bin/bash

echo "Hello, how are you feeling today?"

# will print out dog
echo "$1, is your first argument"

# will print out cat
echo "$2, is your second argument"

# will print out fish, but it will not print out horse
# or any additional arguments
echo "$3, is your remaining arguments"

```

</details>

[go back :house:][home]

### no such file or directory

<details>
<summary>
View Content
</summary>

:link: **Reference**

- [Script cannot find file](https://stackoverflow.com/questions/40923758/script-cannot-find-file)

---

If you attempt to read from a file, you will probably get the error `no such file or directory`. I'm assuming that it might be looking within the root directory. In any case, this is how you can call a script and it will look for content based on the current directory you are in

```linux
cd "$(dirname "$0")"
```

```linux
dir="$(cd $(dirname "$0"); pwd)"
chmod 770 "$dir/somefile"
```

</details>

[go back :house:][home]

### read from a file

<details>
<summary>
View Content
</summary>

:link: **Reference**

- [Shell script read missing last line](https://stackoverflow.com/questions/12916352/shell-script-read-missing-last-line)

:pencil2: **Things to note**

- The read line will not read the last line of a file, unless do the code in a different way
- Apparently, the reason why the while loop doesn't read the last line of code, is because it's expected that you are supposed to leave the last line blank. I don't know, that sounds stupid to me

---

If you want to read input from a file, you can use the while loop to get the line
of text that might be from a text file

#### the basic way to do it

```linux
#!/bin/bash
# This is needed to cd into your current directory
cd "$(dirname "$0")"

while read line
do
  echo $line
done < ../text/t001.txt
# this will print everything except the last line

```

#### the best way to do it

```linux
#!/bin/bash
# This is needed to cd into your current directory
cd "$(dirname "$0")"

# This will read the last line of the files
while read line || [ -n "$line" ]; do echo $line; done < ../text/t001.txt

```

</details>

[go back :house:][home]

### do basic math expression

<details>
<summary>
View Content
</summary>

:link: **Reference**

- [Bash Scripting Tutorial - 4. Arithmetic](https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php)
- [Bash Math Operations (Bash Arithmetic) Explained](https://phoenixnap.com/kb/bash-math)

---

There's a number of ways you can do basic or advanced calculations with linux commands.
Within these small examples, I will show how to use the`let` and `expr` commands. But I included `bc` because I found out that the previous commands sort of suck

#### let

```linux
#!/bin/bash

echo "What age are you?"

read age

# let allows you to wrap caluclations in quotes
# as well as the variable that will store it
# avoid doing division though
let "dogYears = $age * 6"


echo "You'll be $dogYears in dog years"

# you can also do math without putting the equation in quotes
let a=$dogYears+12

# you can also increment the previously made variable, like so
let a++


```

#### expr

:pencil2: **Things to note**

- expr prints the answer as opposed to returning it, so you should only use it if you want to print out the final arithmatic
- expr does not take  or calculate floating point numbers so if you attempt to
do any calculation with it, an error will be thrown
- you can't multiply with the `*` alone, you have to include a slash `\*`
- another annoying thing about `expr` is that you need to have the equation either spaced `$x + $y` or together `$x+$y`, but if you have it like this `$x+ $y`. It will throw an error

```linux
#!/bin/bash

expr 5 + 9

# This won't work
expr 10 * 236 

# But this does
expr 10 \* 236

x=5
y=10

# this will work
expr $x + $y

# this will not work
exprt $x+ $y

```

#### bc

```linux
#!/bin/bash

echo "Sorry to be intrusive, but how much do you weigh?"

read weight

# let and expr doesn't work well with division so bc(basic calculator)
# is the best command to use
kg=$(bc <<< "$weight/2.2046" )

echo "You'll weigh about $kg kilograms in england!"

```

</details>

[go back :house:][home]

### read input

<details>
<summary>
View Content
</summary>

---

This is an example

```linux
#!/bin/bash


echo "Hold are you?"

# the read command will store whatever value you want to the new variable
read age

let "age_left=78 - $age" 

echo "You have $age_left years left before you hit 78"
```

</details>

[go back :house:][home]

### create a comment

<details>
<summary>
View Content
</summary>

---

adding the `#` before anything comments the line out

```linux
#!/bin/bash
# this is a comment
# this another comment


# And here is the third comment

```

</details>

[go back :house:][home]

### create a variable

<details>
<summary>
View Content
</summary>

---

There are no data types in bash so you don't have
declare a type before assigning it a value

```linux
#!/bin/bash

var="value to a variable"

# assigning it to another variables
var2=$var

echo $var2
```

**Note**

- Make sure the variable has no space to the equal sign like this `var="foo"`

</details>

[go back :house:][home]
