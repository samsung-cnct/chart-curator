# Chart for Curator

[![Build Status](https://jenkins.cnct.io/buildStatus/icon?job=pipeline-curator/master)](https://jenkins.cnct.io/job/pipeline-curator/job/master)

Elasticsearch Curator helps you curate, or manage, your Elasticsearch indices by:
* Obtaining the full list of indices from the cluster, as the *actionable list*
* Iterating through a list of user-defined [filters][5] to progressively remove indices from the *actionable* list as needed.

Our Chart deletes all indices prefixed with either `logstash-` or `logsystemd` older than 14 days.

## Installation
### From our chart repository
``` 
helm repo add cnct https://charts.cnct.io
helm repo update
helm install cnct/curator --set security.password="changeme"
```  
### To install from local repository

```
helm install --name my-release --namespace my-namespace ./curator --set security.password="changeme"
```

To install from local, overriding the base image and tag directly:

```
helm install --name my-release --namespace my-namespace \
  --set image.name=bobrik/curator \
  --set image.tag=5.2.0 \
  ./curator --set security.password="changeme"
```

To install from local, overriding with a values file:

```
helm install --name my-release --namespace my-namespace \
  --values ./staging-values.yaml \
  ./curator --set security.password="changeme"
```

In which the file `./staging-values.yaml` contains:

```
image:
  name: bobrik/curator
  tag: 5.2.0

# sets the cron job to execute everyday at 2am
schedule: "00 2 * * *"

description:
  Delete indices older than 7 days and prefixed with logstash-.

filters:
- filtertype: pattern
  kind: prefix
  value: "logstash-"
  exclude: False
- filtertype: age
  source: name
  timestring: '%Y.%m.%d'
  direction: older
  unit: days
  unit_count: 7
  field: null
  stats_result: null
  epoch: null
  exclude: False
```

## Configuration

The following tables lists the configurable parameters of the Curator chart and their default values.

| Parameter                | Description                                     | Default                                 |
| ------------------------ | ----------------------------------------------- | --------------------------------------- |
| `name`                   | Name of the chart                               | `curator`                               |
| `image`                  | FQDN repository/image name                      | `quay.io/samsung_cnct/curator-container`|
| `schedule`               | The cron schedule                               | `30 3 * * *`                            |
| `action`                 | Name of the action                              | `delete_indices`                        |
| `logstashDescription`    | Description of the logstash action              | `<see values.yaml>`                     |
| `logsystemdDescription`  | Description of the logsystemd action            | `<see values.yaml>`                     |
| `options`                | [Options][6] of the action                      | `<see values.yaml>`                     |
| `logstashFilters`        | [Filters][5] for logstash action                | `<see values.yaml>`                     |
| `logsystemdFilters`      | [Filters][5] for logsystemd action              | `<see values.yaml>`                     |
| `client`                 | [Client configuration][7]                       | `<see values.yaml>`                     |
| `logging`                | [Logging configuration][7]                      | `<see values.yaml>`                     |
| `security.password`      | [Logging configuration][7]                      | `<see values.yaml>`                     |

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## References

* [Curator github][2]
* [Curator Reference Documentation][3]
* [Discuss Curator][4]

## Credit

Created and maintained by the Samsung Cloud Native Computing Team.

[1]: https://github.com/app-registry/appr-helm-plugin/blob/master/README.md#install-the-helm-registry-plugin "install helm registry plugin"
[2]: https://github.com/elastic/curator "curator github"
[3]: https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html "curator reference documentation"
[4]: https://discuss.elastic.co/search?q=curator "curator discussion"
[5]: https://www.elastic.co/guide/en/elasticsearch/client/curator/5.2/filters.html "curator filter documentation"
[6]: https://www.elastic.co/guide/en/elasticsearch/client/curator/5.2/options.html "currator options documentation"
[7]: https://www.elastic.co/guide/en/elasticsearch/client/curator/5.2/configfile.html "currator config file  documentation"
