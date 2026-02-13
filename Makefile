COMPONENTS := stable testing
TAGS ?= latest
SHELL ?= /bin/bash

.PHONY: build
build: $(addprefix build-,$(COMPONENTS))

build-%:
	./build.sh $*

push-%:
	for tag in $(TAGS); do \
		podman push sebatec-eu/$*-forgejo-runner:latest ghcr.io/sebatec-eu/$*-forgejo-runner:$$tag; \
	done

.PHONY: clean-untagged-images
clean-untagged-images: $(addprefix clean-untagged-images-,$(COMPONENTS))

clean-untagged-images-%:
	./clean-untagged-images.sh $*

build-stable build-testing:
push-stable push-testing:
