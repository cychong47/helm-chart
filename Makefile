build:
	helm package charts/*
	helm repo index --url https://cychong47.github.io/helm-chart/ .

update-repo:
	git add index.yaml *.tgz
	git ci -m "update package"
	git push origin master
