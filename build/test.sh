#! /bin/sh

[[ -z "$chart_name"   ]] && \
  {
    echo >& "Var '$chart_name' is empty. Cannot continue."
    exit 2
  }

[[ ! -d "${chart_name}" ]] && \
  {
    echo >&2 "Directory for chart '$chart_name' does not exist."
    exit 4
  }

helm lint ${chart_name}
