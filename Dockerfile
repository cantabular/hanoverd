FROM golang:1.27.3-alpine3.24@sha256:d200d2dd76b03a99b52651fd1325aff7dcd35422c35c01bac56571b0507f3deb

RUN apk add git

COPY ./github-host-key /etc/ssh/ssh_known_hosts

# Turn off cgo so that we end up with totally static binaries
ENV CGO_ENABLED=0 GO111MODULE=on

WORKDIR /go/src/github.com/sensiblecodeio/hanoverd/

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go install -v
