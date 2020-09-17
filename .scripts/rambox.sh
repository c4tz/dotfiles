#!/bin/bash

ASARFILE=/opt/rambox/resources/app.asar
TMPFOLDER=/tmp/rambox_custom_css
CSSFILE=$TMPFOLDER/resources/Rambox-all.css

npx asar extract $ASARFILE $TMPFOLDER

echo ".x-tab-bar-default.dontdisturb { background-color: #333 !important }" >> $CSSFILE
echo ".x-tab { background-color: #555 !important }" >> $CSSFILE
echo ".x-tab.x-tab-active { background-color: #777 !important }" >> $CSSFILE

npx asar pack $TMPFOLDER $ASARFILE
