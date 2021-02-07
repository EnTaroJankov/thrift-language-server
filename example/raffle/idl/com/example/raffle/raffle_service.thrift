namespace java com.example.raffle

include 'shared.thrift'
// It seems like when file names conflict, the last imported file with the matching symbol definition
// is used; in order to find the canonical name of a symbol in cases like this, you need to inspect the
// contents of all matching files to resolve the last file with the symbol defined
include 'com/example/finance/lib.thrift'
include 'com/example/library/lib.thrift'

struct SayHelloRequest {
  1: shared.Context context;
  2: string name;
  // resolves com.example.finance.Foo
  3: lib.Foo foo;
  // resolves to com.example.library.Foo
  4: lib.Bar bar;
}

struct SayHelloResponse {
  1: string message;
}

service HelloService {
  SayHelloResponse sayHello(1: SayHelloRequest request) throws (1: lib.CommonError e)
}
