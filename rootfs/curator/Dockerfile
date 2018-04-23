# Docker Definition for ElasticSearch Curator

FROM ubuntu:17.10
LABEL MAINTAINER="Deirdre Storck <deirdre.storck@gmail.com>, Jim Conner <snafu.x@gmail.com>" \
      DESCRIPTION="Docker definition file for elasticsearch curator to be used with Samsung SDS ElasticSearch Chart"

RUN buildDeps='python-pip' && \
    apt-get -qq update && \
    apt-get install -y -qq $buildDeps && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --quiet elasticsearch-curator==5.5.1 && \
		apt-get remove --purge --auto-remove -y -qq $buildDeps binutils perl

ENTRYPOINT [ "/usr/local/bin/curator" ]


