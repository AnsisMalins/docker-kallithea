#!/bin/bash

cd /srv/kallithea/state

if [ ! -f kallithea.ini ]; then
    kallithea-cli config-create kallithea.ini host=0.0.0.0 port=80
fi

if [ ! -f kallithea.db ]; then
    kallithea-cli db-create -c kallithea.ini --force-yes \
        --user admin \
        --password $ADMIN_PASSWORD \
        --email admin@localhost \
        --repos /srv/kallithea/repos \
        --no-public-access
fi

gearbox serve -c kallithea.ini

