#!/usr/bin/python

from pexif import JpegFile
import sys

f = JpegFile.fromFile(sys.argv[1])
print f.set_geo(45, 122)
print f.dump()
f.writeFile(sys.argv[1])
