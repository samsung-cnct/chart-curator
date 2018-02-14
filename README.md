# Chart for Curator

[![pipeline status](https://git.cnct.io/common-tools/samsung-cnct_chart-curator/badges/master/pipeline.svg)](https://git.cnct.io/common-tools/samsung-cnct_chart-curator/commits/master)

Elasticsearch Curator helps you curate, or manage, your Elasticsearch indices by:
* Obtaining the full list of indices from the cluster, as the *actionable list*
* Iterating through a list of user-defined [filters][5] to progressively remove indices from the *actionable* list as needed.

Our Chart deletes all logstash-prefixed indices older than 14 days.

## Installation

### Install via helm + registry
Install Helm and the Helm registry plugin with [these][1] instructions.
To install the latest stable version of this chart:

```
helm registry install quay.io/samsung_cnct/curator:stable
```

To install a specific release:

```
helm registry install quay.io/samsung_cnct/curator@0.0.1-38
```

To see available releases:

```
helm registry show quay.io/samsung_cnct/curator
```

To see available channels and the releases they point to:

```
helm registry channel quay.io/samsung_cnct/curator
```

### Install via helm

To install from local:

```
helm install --name my-release --namespace my-namespace ./curator
```

To install from local, overriding the base image and tag directly:

```
helm install --name my-release --namespace my-namespace \
  --set image.name=bobrik/curator \
  --set image.tag=5.2.0 \
  ./curator
```

To install from local, overriding with a values file:

```
helm install --name my-release --namespace my-namespace \
  --values ./staging-values.yaml \
  ./curator
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
| `image.name`             | FQDN repository/image name                      | `quay.io/samsung_cnct/curator-container`|
| `image.tag`              | Image tag                                       | `latest`                                |
| `schedule`               | The cron schedule                               | `30 3 * * *`                            |
| `action`                 | Name of the action                              | `delete_indices`                        |
| `description`            | Description of the action                       | `<see values.yaml>`                     |
| `options`                | [Options][6] of the action                      | `<see values.yaml>`                     |
| `filters`                | [Filters][5] of the action                      | `<see values.yaml>`                     |
| `client`                 | [Client configuration][7]                       | `<see values.yaml>`                     |
| `logging`                | [Loging configuration][7]                       | `<see values.yaml>`                     |

## References

* [Curator github][2]
* [Curator Reference Documentation][3]
* [Discuss Curator][4]

[1]: https://github.com/app-registry/appr-helm-plugin/blob/master/README.md#install-the-helm-registry-plugin "install helm registry plugin"
[2]: https://github.com/elastic/curator "curator github"
[3]: https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html "curator reference documentation"
[4]: https://discuss.elastic.co/search?q=curator "curator discussion"
[5]: https://www.elastic.co/guide/en/elasticsearch/client/curator/5.2/filters.html "curator filter documentation"
[6]: https://www.elastic.co/guide/en/elasticsearch/client/curator/5.2/options.html "currator options documentation"
[7]: https://www.elastic.co/guide/en/elasticsearch/client/curator/5.2/configfile.html "currator config file  documentation"
