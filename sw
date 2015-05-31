#!/usr/bin/env python

# sw - swap two files

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

import os
import os.path

import stat
import shutil
import tempfile

__program__ = 'sw'
__version__ = '0.1'
__author__  = 'Jason Schulz'
__doc__     = 'sw [-p <pivot>] <a> <b>'

c = sys.argv[0]

def usage():
    print(__doc__)
    sys.exit(1)

def on_error(e, x=1):
    if not e is None:
        print('%s: %s' % (c, e), file=sys.stderr)

    sys.exit(x)

if len(sys.argv) < 3 or len(sys.argv) > 5:
    usage()

pd = None

if sys.argv[1] == '-p':

    pd = sys.argv[2]

    del sys.argv[1:3]

pa = os.path.abspath(sys.argv[1])
pb = os.path.abspath(sys.argv[2])

if pd is None:
    pd = os.path.dirname(pa)

pd = tempfile.mkdtemp(prefix='sw.', dir=pd)
pc = os.path.join(pd, os.path.basename(pb))

try:

    shutil.move(pb, pc)

except OSError as e:

    shutil.rmtree(pd)

    on_error('%s (%s -> %s)' % (e.strerror, pb, pc))

try:

    shutil.move(pa, pb)

except OSError as e:

    if os.path.exists(pb):

        sb = os.lstat(pb)

        if stat.S_ISDIR(sb.st_mode):
            shutil.rmtree(pb)
        else:
            os.unlink(pb)

    shutil.move(pc, pb)
    shutil.rmtree(pd)

    on_error('%s (%s -> %s)' % (e.strerror, pa, pb))

try:

    shutil.move(pc, pa)

except OSError as e:

    if os.path.exists(pa):

        sa = os.lstat(pa)

        if stat.S_ISDIR(sa.st_mode):
            shutil.rmtree(pa)
        else:
            os.unlink(pa)

    shutil.move(pb, pa)
    shutil.move(pc, pb)
    shutil.rmtree(pd)

    on_error('%s (%s -> %s)' % (e.strerror, pc, pa))

try:

    shutil.rmtree(pd)

except OSerror as e:

    on_error('%s (%s)' % (e.strerror, pd))

# vim:ft=python:et:ts=4:sts=4:sw=4:tw=80
