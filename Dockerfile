FROM golang:1.27.3-alpine3.24@sha256:f2c872bcee949b7be9c490efd02b48a8a2fbf947cdf533f1c58525ec9d8170fd

RUN apk add git

COPY ./github-host-key /etc/ssh/ssh_known_hosts

# Turn off cgo so that we end up with totally static binaries
ENV CGO_ENABLED=0 GO111MODULE=on

WORKDIR /go/src/github.com/sensiblecodeio/hanoverd/

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go install -v
