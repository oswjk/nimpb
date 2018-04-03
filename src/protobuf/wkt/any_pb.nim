# Generated by protoc_gen_nim. Do not edit!

import intsets

import protobuf/protobuf

type
    google_protobuf_Any* = ref google_protobuf_AnyObj
    google_protobuf_AnyObj* = object of RootObj
        hasField: IntSet
        type_url: string
        value: bytes

proc newgoogle_protobuf_Any*(): google_protobuf_Any
proc writegoogle_protobuf_Any*(stream: ProtobufStream, message: google_protobuf_Any)
proc readgoogle_protobuf_Any*(stream: ProtobufStream): google_protobuf_Any
proc sizeOfgoogle_protobuf_Any*(message: google_protobuf_Any): uint64

proc newgoogle_protobuf_Any*(): google_protobuf_Any =
    new(result)
    result.hasField = initIntSet()
    result.type_url = ""
    result.value = bytes("")

proc cleartype_url*(message: google_protobuf_Any) =
    message.type_url = ""
    excl(message.hasField, 1)

proc hastype_url*(message: google_protobuf_Any): bool =
    result = contains(message.hasField, 1)

proc settype_url*(message: google_protobuf_Any, value: string) =
    message.type_url = value
    incl(message.hasField, 1)

proc type_url*(message: google_protobuf_Any): string {.inline.} =
    message.type_url

proc `type_url=`*(message: google_protobuf_Any, value: string) {.inline.} =
    settype_url(message, value)

proc clearvalue*(message: google_protobuf_Any) =
    message.value = bytes("")
    excl(message.hasField, 2)

proc hasvalue*(message: google_protobuf_Any): bool =
    result = contains(message.hasField, 2)

proc setvalue*(message: google_protobuf_Any, value: bytes) =
    message.value = value
    incl(message.hasField, 2)

proc value*(message: google_protobuf_Any): bytes {.inline.} =
    message.value

proc `value=`*(message: google_protobuf_Any, value: bytes) {.inline.} =
    setvalue(message, value)

proc sizeOfgoogle_protobuf_Any*(message: google_protobuf_Any): uint64 =
    if hastype_url(message):
        let
            sizeOfField = sizeOfString(message.type_url)
            sizeOfTag = sizeOfUInt32(uint32(makeTag(1, WireType.LengthDelimited)))
        result = result + sizeOfField + sizeOfTag
    if hasvalue(message):
        let
            sizeOfField = sizeOfBytes(message.value)
            sizeOfTag = sizeOfUInt32(uint32(makeTag(2, WireType.LengthDelimited)))
        result = result + sizeOfField + sizeOfTag

proc writegoogle_protobuf_Any*(stream: ProtobufStream, message: google_protobuf_Any) =
    if hastype_url(message):
        writeTag(stream, 1, WireType.LengthDelimited)
        writeString(stream, message.type_url)
    if hasvalue(message):
        writeTag(stream, 2, WireType.LengthDelimited)
        writeBytes(stream, message.value)

proc readgoogle_protobuf_Any*(stream: ProtobufStream): google_protobuf_Any =
    result = newgoogle_protobuf_Any()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = getTagWireType(tag)
        case getTagFieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            settype_url(result, readString(stream))
        of 2:
            expectWireType(wireType, WireType.LengthDelimited)
            setvalue(result, readBytes(stream))
        else: skipField(stream, wireType)

proc serialize*(message: google_protobuf_Any): string =
    let
        ss = newStringStream()
        pbs = newProtobufStream(ss)
    writegoogle_protobuf_Any(pbs, message)
    result = ss.data

proc newgoogle_protobuf_Any*(data: string): google_protobuf_Any =
    let
        ss = newStringStream(data)
        pbs = newProtobufStream(ss)
    result = readgoogle_protobuf_Any(pbs)


