# sh-helpers #

sh-helpers implements some common patterns for working with files and
directories in a shell.

* pm - move p to p'
* cpm - copy p to p' 
* upm - undo p to p'
* sw - swap two files
* pt - pivot file over a command
* pts - pivot file over a command (stdin)

## examples ##

copy (prime) bashrc

    jason@io ~ $ cpm bashrc

swap bashrc and bashrc'

    jason@io ~ $ sw bashrc*

sort a file

    jason@io ~ $ pt sort foo

sort a file and square the second field

    jason@io ~ $ pts sh -c "sort | awk '{ print \$1, \$2 * \$2 }'" foo
    
## install ##

### PyPI ###

    pip install sh-helpers

### source ###

    python setup.py install

## versions ##

0.1 (May, 2015)

* initial release
