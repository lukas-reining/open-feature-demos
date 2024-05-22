GITOPS_REPO ?= https://github.com/lukas-reining/open-feature-demos

install: create-cloud-native-demo create-kubecon-demo

create-kubecon-demo:
	sed 's~{{GITOPS_REPO}}~$(GITOPS_REPO)~g' kubecon-24-demo/app.yaml > kubecon-24-demo/app_tmp.yaml
	kubectl -n argocd apply -f kubecon-24-demo/app_tmp.yaml
	rm kubecon-24-demo/app_tmp.yaml

create-cloud-native-demo:
	sed 's~{{GITOPS_REPO}}~$(GITOPS_REPO)~g' cloud-native-demo/app.yaml > cloud-native-demo/app_tmp.yaml
	kubectl -n argocd apply -f cloud-native-demo/app_tmp.yaml
	rm cloud-native-demo/app_tmp.yaml

update-flags:
	 kubectl apply -n open-feature-kubecon -f kubecon-24-demo/deployment/flags.yaml --validate=false
