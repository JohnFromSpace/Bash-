# Bash-
Bash is the GNU Project's shell—the Bourne Again SHell. This is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh).

## Features
The Bash command syntax is a superset of the Bourne shell command syntax. Bash supports brace expansion, command line completion (Programmable Completion),0 basic debugging and signal handling (using trap) since bash 2.05a among other features. Bash can execute the vast majority of Bourne shell scripts without modification, with the exception of Bourne shell scripts stumbling into fringe syntax behavior interpreted differently in Bash or attempting to run a system command matching a newer Bash builtin, etc. Bash command syntax includes ideas drawn from the KornShell (ksh) and the C shell (csh) such as command line editing, command history (history command), the directory stack, the $RANDOM and $PPID variables, and POSIX command substitution syntax $(…).

Bash's syntax has many extensions lacking in the Bourne shell. Bash can perform integer calculations ("arithmetic evaluation") without spawning external processes. It uses the ((…)) command and the $((…)) variable syntax for this purpose. Its syntax simplifies I/O redirection. For example, it can redirect standard output (stdout) and standard error (stderr) at the same time using the &> operator. This is simpler to type than the Bourne shell equivalent 'command > file 2>&1'. Bash supports process substitution using the <(command) and >(command)syntax, which substitutes the output of (or input to) a command where a filename is normally used. (This is implemented through /proc/fd/ unnamed pipes on systems that support that, or via temporary named pipes where necessary).

## Brace expansion

Brace expansion, also called alternation, is a feature copied from the C shell. It generates a set of alternative combinations. Generated results need not exist as files. The results of each expanded string are not sorted and left to right order is preserved:

$ echo a{p,c,d,b}e <br>
ape ace ade abe <br>
$ echo {a,b,c}{d,e,f} <br>
ad ae af bd be bf cd ce cf <br>

Users should not use brace expansions in portable shell scripts, because the Bourne shell does not produce the same output. <br>

$ # A traditional shell does not produce the same output <br>
$ /bin/sh -c 'echo a{p,c,d,b}e' <br>
a{p,c,d,b}e <br>

When brace expansion is combined with wildcards, the braces are expanded first, and then the resulting wildcards are substituted normally. Hence, a listing of JPEG and PNG images in the current directory could be obtained using:

ls *.{jpg,jpeg,png}    # expands to *.jpg *.jpeg *.png - after which, <br>
                       # the wildcards are processed <br>
echo *.{png,jp{e,}g}   # echo just show the expansions - <br>
                       # and braces in braces are possible. <br>
                       
In addition to alternation, brace expansion can be used for sequential ranges between two integers or characters separated by double dots. Newer versions of Bash allow a third integer to specify the increment. <br>

$ echo {1..10} <br>
1 2 3 4 5 6 7 8 9 10 <br>
$ echo {01..10} <br>
01 02 03 04 05 06 07 08 09 10 <br>
$ echo file{1..4}.txt <br>
file1.txt file2.txt file3.txt file4.txt <br>
$ echo {a..e} <br>
a b c d e <br>
$ echo {1..10..3} <br>
1 4 7 10 <br>
$ echo {a..j..3} <br>
a d g j <br>

When brace expansion is combined with variable expansion (A.K.A. parameter expansion and parameter substitution) the variable expansion is performed after the brace expansion, which in some cases may necessitate the use of the eval built-in, thus: <br>

$ start=1; end=10 <br>
$ echo {$start..$end}  # fails to expand due to the evaluation order <br>
{1..10} <br>
$ eval echo {$start..$end} # variable expansion occurs then resulting string is evaluated <br>
1 2 3 4 5 6 7 8 9 10 <br>
