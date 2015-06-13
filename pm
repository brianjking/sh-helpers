#!/usr/bin/env python

# pm - move p to p`

# Copyright (c) 2015 Jason Schulz <https://github.com/uxcn>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#  
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# author: jason

import sys

import argparse

import os
import os.path

__program__ = 'pm'
__version__ = '0.1.2'
__author__  = 'Jason Schulz'
__doc__     = 'pm [-f] [-i] [-s suffix] path [path ...]'

c = sys.argv[0]

def usage():
    print(__doc__)
    sys.exit(1)

def on_error(e, x=1):
    if not e is None:
        print('%s: %s' % (c, e), file=sys.stderr)

    sys.exit(x)

def init(p):

    p.add_argument('-f', '--force', default=False, dest='f', action='store_const', const=True, help='force')
    p.add_argument('-i', '--interactive', default=False, dest='f',action='store_const', const=False, help='interactive')
    p.add_argument('-s', '--suffix', default="'", dest='s', metavar='suffix', help='suffix')

    p.add_argument('ps', nargs='+', metavar='path', help='paths')

g = argparse.ArgumentParser(add_help=False)

init(g)

a = g.parse_args()

f = a.f
s = a.s

ps = reversed(a.ps)

for p in ps:

    p = os.path.abspath(p)
    pm = '%s%s' % (p, s)

    if os.path.lexists(pm):

        prompt = '%s: overwrite (%s)? ' % (c, pm)

        if not f and input(prompt) not in ['Y', 'y']:
            continue

    try:
        os.rename(p, pm)
    except OSError as e:
        on_error('%s (%s -> %s)' % (e.strerror, p, pm))

# vim:ft=python:et:ts=4:sts=4:sw=4:tw=80
