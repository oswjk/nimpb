# Generated by protoc_gen_nim. Do not edit!

import base64
import intsets
import json
import strutils

import nimpb/nimpb
import nimpb/json as nimpb_json

type
    google_protobuf_Duration* = ref google_protobuf_DurationObj
    google_protobuf_DurationObj* = object of Message
        seconds: int64
        nanos: int32

proc newgoogle_protobuf_Duration*(): google_protobuf_Duration
proc newgoogle_protobuf_Duration*(data: string): google_protobuf_Duration
proc newgoogle_protobuf_Duration*(data: seq[byte]): google_protobuf_Duration
proc writegoogle_protobuf_Duration*(stream: Stream, message: google_protobuf_Duration)
proc readgoogle_protobuf_Duration*(stream: Stream): google_protobuf_Duration
proc sizeOfgoogle_protobuf_Duration*(message: google_protobuf_Duration): uint64

proc newgoogle_protobuf_Duration*(): google_protobuf_Duration =
    new(result)
    initMessage(result[])
    result.seconds = 0
    result.nanos = 0

proc clearseconds*(message: google_protobuf_Duration) =
    message.seconds = 0

proc setseconds*(message: google_protobuf_Duration, value: int64) =
    message.seconds = value

proc seconds*(message: google_protobuf_Duration): int64 {.inline.} =
    message.seconds

proc `seconds=`*(message: google_protobuf_Duration, value: int64) {.inline.} =
    setseconds(message, value)

proc clearnanos*(message: google_protobuf_Duration) =
    message.nanos = 0

proc setnanos*(message: google_protobuf_Duration, value: int32) =
    message.nanos = value

proc nanos*(message: google_protobuf_Duration): int32 {.inline.} =
    message.nanos

proc `nanos=`*(message: google_protobuf_Duration, value: int32) {.inline.} =
    setnanos(message, value)

proc sizeOfgoogle_protobuf_Duration*(message: google_protobuf_Duration): uint64 =
    if message.seconds != 0:
        result = result + sizeOfTag(1, WireType.Varint)
        result = result + sizeOfInt64(message.seconds)
    if message.nanos != 0:
        result = result + sizeOfTag(2, WireType.Varint)
        result = result + sizeOfInt32(message.nanos)
    result = result + sizeOfUnknownFields(message)

proc writegoogle_protobuf_Duration*(stream: Stream, message: google_protobuf_Duration) =
    if message.seconds != 0:
        protoWriteInt64(stream, message.seconds, 1)
    if message.nanos != 0:
        protoWriteInt32(stream, message.nanos, 2)
    writeUnknownFields(stream, message)

proc readgoogle_protobuf_Duration*(stream: Stream): google_protobuf_Duration =
    result = newgoogle_protobuf_Duration()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.Varint)
            setseconds(result, protoReadInt64(stream))
        of 2:
            expectWireType(wireType, WireType.Varint)
            setnanos(result, protoReadInt32(stream))
        else: readUnknownField(stream, result, tag)

proc serialize*(message: google_protobuf_Duration): string =
    let
        ss = newStringStream()
    writegoogle_protobuf_Duration(ss, message)
    result = ss.data

proc newgoogle_protobuf_Duration*(data: string): google_protobuf_Duration =
    let
        ss = newStringStream(data)
    result = readgoogle_protobuf_Duration(ss)

proc newgoogle_protobuf_Duration*(data: seq[byte]): google_protobuf_Duration =
    let
        ss = newStringStream(cast[string](data))
    result = readgoogle_protobuf_Duration(ss)


