# Bash-
Bash is the GNU Project's shell—the Bourne Again SHell. This is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh).

## Features
The Bash command syntax is a superset of the Bourne shell command syntax. Bash supports brace expansion, command line completion (Programmable Completion),0 basic debugging and signal handling (using trap) since bash 2.05a among other features. Bash can execute the vast majority of Bourne shell scripts without modification, with the exception of Bourne shell scripts stumbling into fringe syntax behavior interpreted differently in Bash or attempting to run a system command matching a newer Bash builtin, etc. Bash command syntax includes ideas drawn from the KornShell (ksh) and the C shell (csh) such as command line editing, command history (history command), the directory stack, the $RANDOM and $PPID variables, and POSIX command substitution syntax $(…).

Bash's syntax has many extensions lacking in the Bourne shell. Bash can perform integer calculations ("arithmetic evaluation") without spawning external processes. It uses the ((…)) command and the $((…)) variable syntax for this purpose. Its syntax simplifies I/O redirection. For example, it can redirect standard output (stdout) and standard error (stderr) at the same time using the &> operator. This is simpler to type than the Bourne shell equivalent 'command > file 2>&1'. Bash supports process substitution using the <(command) and >(command)syntax, which substitutes the output of (or input to) a command where a filename is normally used. (This is implemented through /proc/fd/ unnamed pipes on systems that support that, or via temporary named pipes where necessary).

##Brace expansion
