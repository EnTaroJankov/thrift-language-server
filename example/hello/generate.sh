#!/bin/sh

thrift -r -I idl --gen java idl/com/example/hello/hello_service.thrift
