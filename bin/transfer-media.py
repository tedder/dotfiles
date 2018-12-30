#!/usr/bin/python

import os
import stat
import re
import shutil

img_dir = "/Users/ted/Desktop/pix2017/amsterdam/"
mov_dir = "/Users/ted/Desktop/pix2017/amsterdam_mov/"

def process_mount(basedir):
  dcim = os.path.join(basedir, "DCIM")
  s = os.stat(dcim)
  if stat.S_ISDIR(s.st_mode):
    print("dcim dir: {}".format(dcim))
    process_dcim(dcim)
  #for f in os.listdir(basedir):
  #  fullpath = os.path.join(basedir, f)
  #    print("dir: {}".format(fullpath))

def process_dcim(basedir):
  for f in os.listdir(basedir):
    fullpath = os.path.join(basedir, f)
    if f.startswith('.'):
      continue # skip, not processing .foo dirs
    s = os.stat(fullpath)
    if stat.S_ISDIR(s.st_mode):
      print("media dir: {}".format(fullpath))
      process_mediadir(fullpath)

def process_mediadir(basedir):
  for f in os.listdir(basedir):
    fullpath = os.path.join(basedir, f)
    s = os.stat(fullpath)
    if stat.S_ISREG(s.st_mode):
      if fullpath.lower().endswith('jpg'):
        move_image(f, fullpath)
      elif fullpath.lower().endswith('mov') or fullpath.lower().endswith('mp4'):
        if fullpath.lower().endswith('_thm.mp4'):
          # delete thumbnail vid files
          print('deleting: {}'.format(fullpath))
          os.chflags(fullpath, 0)
          os.remove(fullpath)
        else:
          move_movie(f, fullpath)
      else:
        print("did not recognize file extension: {}".format(fullfile))
    else:
      print("not a file: {}".format(fullpath))

def move_file(f, fullpath, dest):
  dest_fullpath = os.path.join(dest, f)
  if not filename_exists(dest_fullpath):
    print("moving: {} -> {}".format(fullpath, dest_fullpath))
    os.chflags(fullpath, 0)
    shutil.move(fullpath, dest_fullpath)
    return

  # try filenames
  splitted = split_media_filename(f)
  if splitted and len(splitted) == 3:
    (letters, numbers, ext) = splitted
  else:
    print("cannot process file, we couldn't parse the filename. {}".format(f))
    return
  #print("tuple: {} / {} / {}".format(letters, numbers, ext))
  print("NOT moving: {} -> {}".format(fullpath, dest_fullpath))
  for x in xrange(1, 999):
    try_f = "{0}_{1}_{2:0>3}.{3}".format(letters, numbers, x, ext)
    dest_fullpath = os.path.join(dest, try_f)
    if not filename_exists(dest_fullpath):
      print("no file here, we can move it: {}".format(dest_fullpath))
      os.chflags(fullpath, 0)
      shutil.move(fullpath, dest_fullpath)
      break

def split_media_filename(f):
  m = re.match(r'(\w+)_(\d+)\.(\w+)', f)
  if not m:
    print("could not figure out how to match this file: {}".format(f))
    return

  groupcount = len(m.groups())
  if groupcount != 3:
    print("unknown number of groups. expected 3, got {}".format(groupcount))
    return

  return (m.group(1), m.group(2), m.group(3))


def move_movie(f, fullpath):
  move_file(f, fullpath, mov_dir)

def move_image(f, fullpath):
  move_file(f, fullpath, img_dir)

def filename_exists(fullpath):
  return os.path.isfile(fullpath)
  #if stat.S_ISREG(s.st_mode):
  #  return true
  #return false



basedir = "/Volumes/"

for f in os.listdir(basedir):
  fullpath = os.path.join(basedir, f)
  if f in ['Macintosh HD', 'readynas']:
    continue # skip, definitely not a sd card
  s = os.stat(fullpath)
  if stat.S_ISDIR(s.st_mode):
    print("dir: {}".format(fullpath))
    process_mount(fullpath)

#os.path.join(

#for root, dir, files in 
