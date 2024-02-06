#!/bin/sh

set -e -u

#docker run --rm \
#-v $PWD/data/templates:/templates \
#-v $PWD/data/variables:/variables \
#jinja2 /templates/json.j2 /variables/json.json --format=json

docker compose run --rm -e VAR3=var3 jinja2 templates/template.j2 variables/variables.json --format=json

exit 0

Usage: jinja2 [options] <input template> <input data>

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  --format=FORMAT       format of input variables: auto, ini, json,
                        querystring, yaml, yml
  -e EXTENSIONS, --extension=EXTENSIONS
                        extra jinja2 extensions to load
  -D key=value          Define template variable in the form of key=value
  -s SECTION, --section=SECTION
                        Use only this section from the configuration
  --strict              Disallow undefined variables to be used within the
                        template
