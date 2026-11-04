FROM golang:1.27.3-alpine3.24@sha256:d200d2dd76b03a99b52651fd1325aff7dcd35422c35c01bac56571b0507f3deb

CMD ["multiple-ports"]
EXPOSE 80 443

COPY . /go/src/multiple-ports
RUN GO111MODULE=auto go install -v /go/src/multiple-ports
