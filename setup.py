from distutils.core import setup

setup(
        url                 = 'https://github.com/uxcn/sh-helpers',
        name                = 'sh-helpers',
        version             = '0.1',
        fullname            = 'sh-helpers',
        description         = 'simple patterns for manipulating files and directories in a shell',
        long_description    = '''
sh-helpers

sh-helpers implements some common patterns for working with files and
directories in a shell.

* pm - move p to p'
* cpm - copy p to p' 
* upm - undo p to p'
* sw - swap two paths
* pt - pivot file over a command
* pts - pivot file over a command (stdin)

examples
--------

copy (prime) bashrc
::

    jason@io ~ $ cpm bashrc

swap bashrc and bashrc'
::

    jason@io ~ $ sw bashrc*

sort a file
::

    jason@io ~ $ pt sort foo

sort a file and square the second field
::

    jason@io ~ $ pts sh -c "sort | awk '{ print \$1, \$2 * \$2 }'" foo

install
-------

PyPI

    pip install sh-helpers

source

    python setup.py install

versions
--------

0.1 (May, 2015)

* initial release
''',
        classifiers         = ['Development Status :: 4 - Beta',
                               'Environment :: Console',
                               'Intended Audience :: Developers',
                               'Intended Audience :: System Administrators',
                               'Topic :: System :: Archiving',
                               'Topic :: System :: Archiving :: Backup',
                               'Topic :: Software Development',
                               'Topic :: System :: Filesystems',
                               'Topic :: System :: Shells',
                               'Topic :: System :: System Shells',
                               'Natural Language :: English',
                               'Operating System :: OS Independent',
                               'Programming Language :: Python',
                               'Programming Language :: Python :: 3',
                               'License :: OSI Approved :: MIT License'],
        author              = 'Jason Schulz',
        maintainer          = 'Jason Schulz',
        author_email        = 'jason@schulz.name',
        maintainer_email    = 'jason@schulz.name',
        keywords            = 'shell path file directory helper swap pivot',
        license             = 'MIT - http://opensource.org/licenses/mit-license.php',
        scripts             = ['pm', 'cpm', 'upm', 'sw', 'pt', 'pts'],
)

