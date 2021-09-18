#!/bin/bash

ASARFILE=/opt/Rambox/resources/app.asar
TMPFOLDER=/tmp/rambox_custom_css
TMPFILE=/tmp/rambox.asar
CSSFILE=$TMPFOLDER/resources/Rambox-all.css

npx asar extract $ASARFILE $TMPFOLDER

echo ".x-tab-bar-default { background-color: #333 !important }" >> $CSSFILE
echo ".x-tab-bar-default.dontdisturb { background-color: #333 !important }" >> $CSSFILE
echo ".x-tab { background-color: #555 !important }" >> $CSSFILE
echo ".x-tab.x-tab-active { background-color: #777 !important }" >> $CSSFILE

npx asar pack $TMPFOLDER $TMPFILE
mv $TMPFILE $ASARFILE
rm -rf $TMPFOLDER
