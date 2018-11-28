# Docker Definition for ElasticSearch Curator

FROM debian:stable-slim
LABEL MAINTAINER="OSS Maintainers <oss-maintainer@samsung-cnct.io>" \
  DESCRIPTION="Docker definition file for elasticsearch curator to be used with Samsung SDS ElasticSearch Chart"

RUN apt-get -qq update && \
  apt-get install -y -qq python-pip && \
  pip install --quiet elasticsearch-curator==5.6.0 && \
  apt-get remove --purge --auto-remove -y -qq python-pip binutils perl && \
  rm -rf /var/lib/apt/lists/* /var/cache/* /var/log/* /root/cache

ENTRYPOINT [ "/usr/local/bin/curator" ]
