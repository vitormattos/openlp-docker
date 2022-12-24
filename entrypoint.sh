#!/bin/bash

# Clone OpenLP repository, if needed
if [ ! -d "/usr/src/openlp/.git" ]; then
    git clone --progress --single-branch --depth 1 --branch "${OPENLP_VERSION}"  https://gitlab.com/openlp/openlp /tmp/openlp
    rsync -r /tmp/openlp/ /usr/src/openlp
    chown -R username:username /usr/src/openlp
    cd /usr/src/openlp/scripts
    ./generate_translations.sh
fi
/usr/src/openlp/run_openlp.py
