COMPONENTS := node
BUILDS := $(addprefix build-,$(COMPONENTS))

.PHONY: build
build: $(BUILDS)

build-%:
	podman build -f $*/Dockerfile -t ghcr.io/sebatec-eu/$*-forgejo-runner:latest --timestamp=$(shell git log -1 --pretty=%ct node) --build-arg=IMAGE_REVISION=$(shell git log -1 --pretty=%H $*)

build-node:
