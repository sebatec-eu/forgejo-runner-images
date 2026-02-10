COMPONENTS := node
BUILDS := $(addprefix build-,$(COMPONENTS))

.PHONY: build
build: $(BUILDS)

build-%:
	podman build -f $*/Dockerfile -t ghcr.io/sebatec-eu/$*-forgejo-runner:latest --build-arg=IMAGE_REVISION=$(git log -1 --pretty=%H $*)

build-node:
