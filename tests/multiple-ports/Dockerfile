FROM golang:1.26rc2-alpine

CMD ["multiple-ports"]
EXPOSE 80 443

COPY . /go/src/multiple-ports
RUN GO111MODULE=auto go install -v /go/src/multiple-ports
