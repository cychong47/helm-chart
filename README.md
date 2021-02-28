# helm-chart
Helm charts


# How to use

## Build Helm charts
```
    helm package charts/*
    helm repo index --url https://cychong47.github.io/helm-chart/ .
    git add index.yaml *.tgz
```

## Upload to helm chart repositories
```
    git ci -m "update package"
    git push origin master
```
