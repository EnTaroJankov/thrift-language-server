namespace java com.example.raffle

include 'shared.thrift'
// It seems like when file names conflict, the last imported file with the matching symbol definition
// is used
include 'com/example/finance/lib.thrift'
include 'com/example/library/lib.thrift'

struct SayHelloRequest {
  1: shared.Context context;
  2: string name;
  3: lib.Foo foo;
}

struct SayHelloResponse {
  1: string message;
}

service HelloService {
  SayHelloResponse sayHello(1: SayHelloRequest request) throws (1: lib.CommonError e)
}
