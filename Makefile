GITOPS_REPO ?= https://github.com/lukas-reining/open-feature-demos

install: create-of-operator create-cloud-native-demo create-kubecon-demo

create-of-operator:
	sed 's~{{GITOPS_REPO}}~$(GITOPS_REPO)~g' of-operator/app.yaml > of-operator/app_tmp.yaml
	kubectl -n argocd apply -f of-operator/app_tmp.yaml
	rm of-operator/app_tmp.yaml

create-kubecon-demo:
	sed 's~{{GITOPS_REPO}}~$(GITOPS_REPO)~g' kubecon-24-demo/app.yaml > kubecon-24-demo/app_tmp.yaml
	kubectl -n argocd apply -f kubecon-24-demo/app_tmp.yaml
	rm kubecon-24-demo/app_tmp.yaml


create-cloud-native-demo:
	sed 's~{{GITOPS_REPO}}~$(GITOPS_REPO)~g' cloud-native-demo/app.yaml > cloud-native-demo/app_tmp.yaml
	kubectl -n argocd apply -f cloud-native-demo/app_tmp.yaml
	rm cloud-native-demo/app_tmp.yaml
