# container-curator
[![Build Status](https://jenkins.migrations.cnct.io/buildStatus/icon?job=pipeline-curator/master)](https://jenkins.migrations.cnct.io/job/pipeline-curator/job/master)

Elasticsearch curator is a management tool for indices in elasticsearch.

This repo contains a Dockerfile to build and test the [curator](https://quay.io/repository/samsung_cnct/curator-container) container. This container is used by [chart-curator](https://github.com/samsung-cnct/chart-curator).  Deployments to Kubernetes should use a [Configmap](https://kubernetes.io/docs/tasks/configure-pod-container/configmap/).

[Curator github](https://github.com/elastic/curator)    
[Curator Reference Documentation](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html)        
[Discuss Curator](https://discuss.elastic.co/search?q=curator)
