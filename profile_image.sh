#!/bin/bash
set -e

function import_user_picture() {
    local USERNAME=$1
    local USERPIC=$2

    declare -r DSIMPORT_CMD="/usr/bin/dsimport"
    declare -r ID_CMD="/usr/bin/id"

    declare -r MAPPINGS='0x0A 0x5C 0x3A 0x2C'
    declare -r ATTRS='dsRecTypeStandard:Users 2 dsAttrTypeStandard:RecordName externalbinary:dsAttrTypeStandard:JPEGPhoto'

    if [ ! -f "${USERPIC}" ]; then
        echo "User image required"
        return 1
    fi

    # Check that the username exists - exit on error
    ${ID_CMD} "${USERNAME}" &>/dev/null || { echo "User does not exist"; return 1; }

    declare -r PICIMPORT="$(mktemp -t ${USERNAME}_dsimport)" || return 1
    trap 'rm -f ${PICIMPORT}' EXIT

    printf "%s %s \n%s:%s" "${MAPPINGS}" "${ATTRS}" "${USERNAME}" "${USERPIC}" >"${PICIMPORT}"
    ${DSIMPORT_CMD} "${PICIMPORT}" /Local/Default M &&
        echo "Successfully imported ${USERPIC} for ${USERNAME}."
}

#import_user_picture "$username" "$path/of/photo"


