SOURCEDIR=.
SOURCES := $(shell find $(SOURCEDIR) -prune -o -name '*.go')

test: dep
	dep ensure
	go test .

dep:
ifeq (, $(shell which dep))
	go get -u github.com/golang/dep/cmd/dep
endif

all: prelog cmdtmpl

prelog: $(SOURCES)
	go build ./cmd/prelog

cmdtmpl: $(SOURCES)
	go build ./cmd/cmdtmpl

clean:
	rm -f prelog
	rm -f cmdtmpl
