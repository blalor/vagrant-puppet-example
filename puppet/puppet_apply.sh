#!/bin/bash

basedir="$( dirname $( readlink -f "${0}" ) )"

## required for the relative datadir path in hiera.yaml
cd ${basedir}/manifests

exec puppet apply \
    --hiera_config ${basedir}/manifests/hiera.yaml \
    --modulepath ${basedir}/modules \
    ${basedir}/manifests/default.pp
