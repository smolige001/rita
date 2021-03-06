VERSION := $(shell git describe --always --long --dirty --tags)
GOPATH := $(GOPATH)
BINARY := rita

LDFLAGS=-ldflags="-X github.com/ocmdev/rita/config.VERSION=${VERSION}"


default:
	dep ensure
	go build ${LDFLAGS}

# Having issues with 'go install' + LDFLAGS using sudo and the
# install script. This is a workaround.
install:
	dep ensure
	go build ${LDFLAGS} -o ${GOPATH}/bin/${BINARY}

