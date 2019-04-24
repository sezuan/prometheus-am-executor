ifndef TMPDIR
export TMPDIR := /tmp
endif

.PHONY = test deps env build all

export GOPATH := $(TMPDIR)/prometheus-am-executor-go
export GOBIN := $(GOPATH)/bin

env:
	mkdir -p $(GOBIN)
	go get github.com/juju/testing/checkers

deps: env
	go env GOPATH
	go get

build: deps
	go build -o $(GOBIN)/prometheus-am-executor

test: deps
	go test
	./scripts/integration

all: test build