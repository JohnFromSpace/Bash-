# Bash-
Bash is the GNU Project's shell—the Bourne Again SHell. This is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh).

## Features
The Bash command syntax is a superset of the Bourne shell command syntax. Bash supports brace expansion, command line completion (Programmable Completion),0 basic debugging and signal handling (using ```trap```) since bash 2.05a among other features. Bash can execute the vast majority of Bourne shell scripts without modification, with the exception of Bourne shell scripts stumbling into fringe syntax behavior interpreted differently in Bash or attempting to run a system command matching a newer Bash builtin, etc. Bash command syntax includes ideas drawn from the KornShell (ksh) and the C shell (csh) such as command line editing, command history (```history``` command), the directory stack, the ```$RANDOM``` and ```$PPID``` variables, and POSIX command substitution syntax ```$(…)```.

Bash's syntax has many extensions lacking in the Bourne shell. Bash can perform integer calculations ("arithmetic evaluation") without spawning external processes. It uses the ```((…))``` command and the ```$((…))``` variable syntax for this purpose. Its syntax simplifies I/O redirection. For example, it can redirect standard output (stdout) and standard error (stderr) at the same time using the &> operator. This is simpler to type than the Bourne shell equivalent 'command > file 2>&1'. Bash supports process substitution using the <(command) and >(command)syntax, which substitutes the output of (or input to) a command where a filename is normally used. (This is implemented through /proc/fd/ unnamed pipes on systems that support that, or via temporary named pipes where necessary).

## Brace expansion

Brace expansion, also called alternation, is a feature copied from the C shell. It generates a set of alternative combinations. Generated results need not exist as files. The results of each expanded string are not sorted and left to right order is preserved:

```
$ echo a{p,c,d,b}e 
ape ace ade abe 
$ echo {a,b,c}{d,e,f} 
ad ae af bd be bf cd ce cf
```

Users should not use brace expansions in portable shell scripts, because the Bourne shell does not produce the same output. 

```
$ # A traditional shell does not produce the same output
$ /bin/sh -c 'echo a{p,c,d,b}e'
a{p,c,d,b}e 
```

When brace expansion is combined with wildcards, the braces are expanded first, and then the resulting wildcards are substituted normally. Hence, a listing of JPEG and PNG images in the current directory could be obtained using:

```
ls *.{jpg,jpeg,png}    # expands to *.jpg *.jpeg *.png - after which, 
                       # the wildcards are processed 
echo *.{png,jp{e,}g}   # echo just show the expansions - 
                       # and braces in braces are possible. 
```

In addition to alternation, brace expansion can be used for sequential ranges between two integers or characters separated by double dots. Newer versions of Bash allow a third integer to specify the increment. 

```
$ echo {1..10} 
1 2 3 4 5 6 7 8 9 10 
$ echo {01..10} 
01 02 03 04 05 06 07 08 09 10 
$ echo file{1..4}.txt 
file1.txt file2.txt file3.txt file4.txt 
$ echo {a..e} 
a b c d e 
$ echo {1..10..3} 
1 4 7 10 
$ echo {a..j..3} 
a d g j 
```

When brace expansion is combined with variable expansion (A.K.A. parameter expansion and parameter substitution) the variable expansion is performed after the brace expansion, which in some cases may necessitate the use of the eval built-in, thus: 

```
$ start=1; end=10 
$ echo {$start..$end}  # fails to expand due to the evaluation order 
{1..10} 
$ eval echo {$start..$end} # variable expansion occurs then resulting string is evaluated 
1 2 3 4 5 6 7 8 9 10 
```
