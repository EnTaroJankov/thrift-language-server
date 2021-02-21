namespace java com.example.library

enum ErrorCode {
  BAD_REQUEST = 1
}

exception CommonError {
  1: ErrorCode code;
  2: string error_message;
}

struct Foo {
  1: string fooer;
}
