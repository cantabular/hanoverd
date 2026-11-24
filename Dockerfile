FROM golang:1.27.4-alpine3.24@sha256:70bd7ddea8b6cbe5d6943cde279d6b67feb10cc924fb9100d1d8757c1575b280

RUN apk add git

COPY ./github-host-key /etc/ssh/ssh_known_hosts

# Turn off cgo so that we end up with totally static binaries
ENV CGO_ENABLED=0 GO111MODULE=on

WORKDIR /go/src/github.com/sensiblecodeio/hanoverd/

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go install -v
