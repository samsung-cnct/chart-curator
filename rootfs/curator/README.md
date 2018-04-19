# container-curator
[![pipeline status](https://git.cnct.io/common-tools/samsung-cnct_container-curator/badges/master/pipeline.svg)](https://git.cnct.io/common-tools/samsung-cnct_container-curator/commits/master)

Elasticsearch curator is a management tool for indices in elasticsearch.

This repo contains a Dockerfile and Gitlab file to build and test the [quay.io/samsung_cnct/container-curator](https://quay.io/repository/samsung_cnct/curator-container) container. This container is used by the [chart-curator](https://github.com/samsung-cnct/chart-curator) repo.  Deployments to Kubernetes should use a [Configmap](https://kubernetes.io/docs/tasks/configure-pod-container/configmap/).

[Curator github](https://github.com/elastic/curator)    
[Curator Reference Documentation](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html)        
[Discuss Curator](https://discuss.elastic.co/search?q=curator)
