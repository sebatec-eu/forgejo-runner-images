COMPONENTS := node
BUILDS := $(addprefix build-,$(COMPONENTS))
TAGS ?= latest

.PHONY: build
build: $(BUILDS)

build-%:
	podman build -f $*/Dockerfile -t ghcr.io/sebatec-eu/$*-forgejo-runner:latest --timestamp=$(shell git log -1 --pretty=%ct node) --build-arg=IMAGE_REVISION=$(shell git log -1 --pretty=%H $*)


build-node:

push-%:
	for tag in $(TAGS); do \
		podman push sebatec-eu/$*-forgejo-runner:latest ghcr.io/sebatec-eu/$*-forgejo-runner:$$tag; \
	done

push-node:
