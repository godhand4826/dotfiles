#!/bin/bash
id=`xinput list | grep -i "Touchpad" | cut -d'=' -f2 | cut -d'[' -f1`
tap_to_click_id=`xinput list-props $id | \
                      grep -i "Tapping Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
xinput --set-prop $id $tap_to_click_id 1
