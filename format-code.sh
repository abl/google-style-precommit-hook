#!/usr/bin/env bash
set -euo pipefail

FORMATTER="$(dirname "$0")/google-java-format.sh"

"${FORMATTER}" --replace $*
