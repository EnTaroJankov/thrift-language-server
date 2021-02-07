#!/bin/sh

thrift -r -I idl --gen java idl/com/example/raffle/raffle_service.thrift
