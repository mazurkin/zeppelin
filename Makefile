# Zeppelin
#
# https://swcarpentry.github.io/make-novice/reference.html
# https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
# https://www.gnu.org/software/make/manual/make.html
# https://www.gnu.org/software/make/manual/html_node/Special-Targets.html
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

SHELL := /bin/bash

DOCKER_NAME = apache/zeppelin
DOCKER_TAG  = 0.11.1

.DEFAULT_GOAL = docker-run

.PHONY: docker-run
docker-run:
	@docker run \
		--name "zeppelin" \
		--hostname="zeppelin" \
		--rm \
		--interactive \
		--tty \
		--cpus 2 \
		--memory 1GB \
		--user "$$(id -u):$$(id -g)"
		--publish "0.0.0.0:8080:8080/tcp" \
		$(DOCKER_NAME):$(DOCKER_TAG)
