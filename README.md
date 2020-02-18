# grpc-gateway-docker

Image to generate a [gRPC gateway](https://grpc-ecosystem.github.io/grpc-gateway/) from a proto.

## Generate gRPC gateway from a proto

To generate the gRPC Gateway:

```sh
export PROTO_ROOT=your/proto/root
export API_CONF_PATH=your/api/config/file
export OUT_DIR=your/output/dir
export PROTO_PATH=$PROTO_ROOT/your/service.proto
docker run --rm -v `pwd`:/tmp/grpc pasdam/grpc-gateway:1.3-alpine protoc -I$(PROTO_ROOT) --grpc-gateway_out=logtostderr=true,grpc_api_configuration=$(API_CONF_PATH):$(OUT_DIR) $(PROTO_PATH)
```

Note that `OUT_DIR` should be inside the current working dir, or mounted as separated volume, otherwise the generated code will be only present in the container.
