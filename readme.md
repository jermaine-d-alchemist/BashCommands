# Bash Scripting
Here are the common code snippets to create bash scripts 

## How To

- [do basic math expression][math-exp]
- [create a variable][create-var]
- [create a comment][create-comm]
- [read input][read-inpt]

[math-exp]:#do-basic-math-expression
[read-inpt]:#read-input
[create-var]:#create-a-variable
[create-comm]:#create-a-comment
[home]:#bash-scripting

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
Within these small examples, I will show how to use the`let` and `expr` commands


```linux
#!/bin/bash

echo "What age are you?"

read age

# let allows you to wrap caluclations in quotes
# as well as the variable that will store it
# avoid doing division though
let "dogYears = $age * 6"


echo "You'll be $dogYears in dog years"

```

```linux
#!/bin/bash

echo "Sorry to be intrusive, but how much do you weigh?"

read weight

# let and expr don't work well with division so bc(basic calculator)
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