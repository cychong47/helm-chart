build:
	helm package charts/*
	helm repo index --url https://cychong47.github.io/helm-chart/ .
