FROM golang:1.27.1-alpine@sha256:8a5910f31396cd4d89662f56c68b3ae31d374308270a1c3bd96672ee5ed43414

CMD ["multiple-ports"]
EXPOSE 80 443

COPY . /go/src/multiple-ports
RUN GO111MODULE=auto go install -v /go/src/multiple-ports
