#!/bin/sh

set -e -u

VAR3=vAR3 jinja2 templates/template.j2 variables/variables.json --format=json
