FROM golang:1.27.1-alpine@sha256:cf6fca6641884b8433441b2b0652976f975e1d0fdd26d177eaaf8596087f3125

RUN apk add git

COPY ./github-host-key /etc/ssh/ssh_known_hosts

# Turn off cgo so that we end up with totally static binaries
ENV CGO_ENABLED=0 GO111MODULE=on

WORKDIR /go/src/github.com/sensiblecodeio/hanoverd/

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go install -v
