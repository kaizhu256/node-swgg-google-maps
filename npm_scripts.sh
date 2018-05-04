#!/bin/sh
# jslint-utility2

shNpmScriptApidocRawCreate () {(set -e
# this function will create the raw apidoc
    export npm_config_npm_package_name="${npm_config_npm_package_name:-$npm_package_name}"
    (set -e
    cd ../swgg-google-all
    npm run apidocRawCreate
    )
    cp "../swgg-google-all/tmp/apidoc.raw/.apidoc.raw.$npm_config_npm_package_name.html" .
)}

shNpmScriptApidocRawFetch () {(set -e
# this function will fetch the raw apidoc
    export npm_config_npm_package_name="${npm_config_npm_package_name:-$npm_package_name}"
    if [ ! -d ../swgg-google-all ]
    then
        git clone https://github.com/kaizhu256/node-swgg-google-all ../swgg-google-all
    fi
    (set -e
    cd ../swgg-google-all
    npm run apidocRawFetch
    )
)}

shNpmScriptPostinstall () {
# this function will do nothing
    return
}

# run command
"$@"
