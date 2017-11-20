#! /bin/sh

[[ -z "$CHART_NAME"   ]] && \
  {
    echo >& "Var '$CHART_NAME' is empty. Cannot continue."
    exit 2
  }

[[ ! -d "${CHART_NAME}" ]] && \
  {
    echo >&2 "Directory for chart '$CHART_NAME' does not exist."
    exit 4
  }

helm lint ${CHART_NAME}
