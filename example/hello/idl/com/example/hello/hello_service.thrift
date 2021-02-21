namespace java com.example.hello

include 'shared.thrift'
// It seems like when file names conflict, the last imported file with the matching symbol definition
// is used; in order to find the canonical name of a symbol in cases like this, you need to inspect the
// contents of all matching files to resolve the last file with the symbol defined
include 'com/example/finance/lib.thrift'
include '../library/lib.thrift'


struct SayHelloRequest {
  // FQN: com/example/hello/shared.thrift.(Context)
  1: shared.Context context;
  2: string name;
  // FQN: com/example/library/lib.thrift.(Foo)
  // resolves com.example.library.Foo
  3: lib.Foo foo;
  // FQN: com/example/finance/lib.thrift.(Bar)
  // resolves to com.example.finance.Bar
  4: lib.Bar bar;
}

struct SayHelloResponse {
  1: string message;
}

service HelloService {
  SayHelloResponse sayHello(1: SayHelloRequest request) throws (1: lib.CommonError e)
}
