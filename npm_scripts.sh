#!/bin/sh
# jslint-utility2

shNpmScriptApidocRawCreate () {(set -e
# this function will create the raw apidoc
    (cd ../swgg-google-all && npm run apidocRawCreate "$npm_package_name")
    cp "../swgg-google-all/tmp/apidoc.raw/.apidoc.raw.$npm_package_name.html" .
    #!! npm run apidocRawCreate "$npm_package_name"
    #!! find developer.github.com/v3 -name index.html -type f | \
        #!! sed -e "s/\/index.html//" | \
        #!! sort | \
        #!! sed -e "s/\(developer.github.com\/.*\)/\1\/index.html/" | \
        #!! xargs -I @ -n 1 sh -c "printf '\\n@\\n' && cat @" | \
        #!! sed -e "s| *\$||" > .apidoc.raw.html
    #!! cp .apidoc.raw.html ../..
)}

shNpmScriptApidocRawFetch () {(set -e
# this function will fetch the raw apidoc
    if [ ! -d ../swgg-google-all ]
    then
        git clone https://github.com/kaizhu256/node-swgg-google-all ../swgg-google-all
    fi
    (cd ../swgg-google-all && npm run apidocRawFetch "$npm_package_name")
)}

shNpmScriptPostinstall () {
# this function will do nothing
    return
}

# run command
"$@"
