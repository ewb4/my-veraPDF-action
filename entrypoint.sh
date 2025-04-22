#!/bin/sh -l

if [ "${INPUT_PDF_FILE}" = 'NULL' ]; then
  /opt/verapdf/verapdf --help
  echo "::notice file=entrypoint.sh,line=5::PDF_FILE variable not set"
  exit 1
fi

COMPOSED_ARGS=""

    ${INPUT_ADDLOGS}
    ${INPUT_FORMAT}
    ${INPUT_FLAVOUR}
    ${INPUT_LOGLEVEL}
    ${INPUT_PREFIX}
    ${INPUT_VERBOSE}