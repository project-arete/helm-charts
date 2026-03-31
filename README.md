# Arete Helm Charts

A repository for helm charts.  Uses [chart-releaser](https://github.com/helm/chart-releaser) to automagically build and release charts using Github Actions.

## Howto

Create your chart, add it to the `charts/` directory:

Add, then push your chart to `main` branch. From there the [chart-releaser Action](./.github/workflows/release.yml) will then run to package your chart. It will then use Github pages to "deploy" or "host" the repository.

### Add this repository to helm

```
$ helm repo add arete https://arete-project.github.io/helm-charts/

$ helm repo update

$ helm search repo | grep arete

$ helm search repo | grep -i arete

arete/Arete                        0.1.0                           Install Arete on your Kubernetes Cluster
arete/arete-cli                    0.1.0           1.0.0           A Helm chart installing Arete CLI
arete/arete-etcd                   0.1.0           1.0.0           A Helm chart installing ETCD for Arete
arete/arete-orchestrator           0.1.0           1.0.0           A Helm chart installing Arete Orchestrator
```


## Updating the mono-chart

1. Make necessary changes to submodule.
1. Update the chart version in the submodule
1. Update the dependency version in arete [Chart.yaml](./charts/arete/Chart.yaml)
1. Run `helm dependency update`
