#!/usr/bin/env bash
set -euo pipefail

RELEASE_NAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION:=1.7}
JARFILE=${RELEASE_NAME}-all-deps.jar
RELEASE_URI=https://github.com/google/google-java-format/releases/download/${RELEASE_NAME}/${JARFILE}

mkdir -p ${GOOGLE_JAVA_FORMAT_CACHE:=${HOME}/.google-style-precommit-hook}

FORMATTER="${GOOGLE_JAVA_FORMAT_CACHE}/${JARFILE}"

if [ ! -f "${FORMATTER}" ]
then
    curl -sLJ "${RELEASE_URI}" -o "${FORMATTER}"
    chmod 755 "${FORMATTER}"
fi

if [[ -v JAVA_HOME ]]
then
    JAVA="${JAVA_HOME}/bin/java"
else
    JAVA="${GOOGLE_JAVA_FORMAT_JAVA:-java}"
fi

"${JAVA}" -jar "${FORMATTER}" $*
