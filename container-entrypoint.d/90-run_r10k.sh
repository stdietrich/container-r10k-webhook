#!/bin/sh

su - puppet -c "/usr/local/bin/r10k deploy environment --modules"
