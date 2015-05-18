#!/usr/bin/python

import yaml
import json
import sys

data = yaml.load(open(sys.argv[1]))
print json.dumps(data, indent=2)
