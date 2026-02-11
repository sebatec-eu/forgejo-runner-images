COMPONENTS := stable testing
BUILDS := $(addprefix build-,$(COMPONENTS))
TAGS ?= latest

.PHONY: build
build: $(BUILDS)

build-%:
	./build.sh $*

build-stable:
build-testing:

push-%:
	for tag in $(TAGS); do \
		podman push sebatec-eu/$*-forgejo-runner:latest ghcr.io/sebatec-eu/$*-forgejo-runner:$$tag; \
	done

push-stable:
push-testing:
