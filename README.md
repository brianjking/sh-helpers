# sh-helpers #

sh-helpers is a set of commands for some common patterns working with files and paths in
a shell. 

* pm - move p to p'
* cpm - copy p to p' 
* upm - undo p to p'
* sw - swap two files
* pt - pivot file over a command
* pts - pivot file over a command (stdin)

![fore](https://raw.githubusercontent.com/uxcn/sh-helpers/master/docs/golf.gif)

## examples ##

copy (prime) bashrc

    jason@io ~ $ cpm bashrc

swap bashrc and bashrc'

    jason@io ~ $ sw bashrc*

sort a file

    jason@io ~ $ pt sort foo

sort a file and square the second field

    jason@io ~ $ pts sh -c "sort | awk '{ print \$1, \$2 * \$2 }'" foo

## why ##

I mostly use these to reduce typing necessary to do common things in a shell.
For example, copying a file to a backup file, normally the command is similar
to

    jason@io ~ $ cp bashrc bashrc.old

Using `cpm` it's less to type, so it's a bit faster and bit less typo prone.

    jason@io ~ $ cpm bashrc

The commands compound reasonably well too.  Normally with a group of files the
commands would be

    jason@io ~ $ cp a.cpp a.cpp.old
    jason@io ~ $ cp b.cpp b.cpp.old
    jason@io ~ $ cp c.cpp c.cpp.old

Or if it's comfortable using bash syntax

    jason@io ~ $ for f in *.cpp; do cp $f $f.old; done

Using `cpm` is a bit shorter

    jason@io ~ $ cpm *.cpp

They can combine in some subtle ways as well

    jason@io ~ $ cpm bashrc
    jason@io ~ $ ls
    bashrc bashrc'
    jason@io ~ $ echo 'alias pm="pm -f"' >> bashrc
    jason@io ~ $ sw bashrc*

Or with `upm`, shell globbing can give something similar to a `git stash pop`

    jason@io ~/src $ ls
    a.cpp a.cpp' a.cpp'' a.hpp a.hpp' a.hpp''
    jason@io ~/src $ upm a.*
    jason@io ~/src $ ls
    a.cpp a.cpp' a.hpp a.hpp'

## aliases ##

Aliases are a good way to change the default arguments.  Some possibly useful ones...

    alias pm="pm -f -s .old"
    alias cpm="cpm -f -s .old"
    alias upm="upm -f -s .old"
    
## install ##

### PyPI ###

    pip install sh-helpers

### source ###

    python setup.py install

## versions ##

0.1.2 (June, 2015)

* add minor options

0.1.1 (June, 2015)

* minor bugfixes

0.1 (May, 2015)

* initial release
