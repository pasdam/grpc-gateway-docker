FROM golang:1.13.8-alpine3.11 as builder

RUN apk add --update --no-cache \
        git

ENV GOLANG_PROTOBUF_VERSION=1.3.3
ENV GRPC_GATEWAY_VERSION=1.13.0
RUN GO111MODULE=on go get \
        github.com/golang/protobuf/protoc-gen-go@v${GOLANG_PROTOBUF_VERSION} \
        github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway@v${GRPC_GATEWAY_VERSION} \
        github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger@v${GRPC_GATEWAY_VERSION}


FROM alpine:3.11.3

WORKDIR /tmp/grpc

COPY --from=builder /go/bin/protoc-gen-* /usr/local/bin/

RUN apk add --update --no-cache \
        make \
        protobuf
