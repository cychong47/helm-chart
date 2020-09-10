# helm-chart
Helm charts


# How to use
```
    helm package charts/*
    helm repo index --url https://cychong47.github.io/helm-chart/ .
    git add index.yaml *.tgz
    git ci -m "update package"
    git push origin master
```
