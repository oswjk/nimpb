# Generated by protoc_gen_nim. Do not edit!

import intsets
import tables
export tables

import nimpb/nimpb

type
    google_protobuf_NullValue* {.pure.} = enum
        NULL_VALUE = 0
    google_protobuf_Struct* = ref google_protobuf_StructObj
    google_protobuf_StructObj* = object of RootObj
        hasField: IntSet
        fields: TableRef[string, google_protobuf_Value]
    google_protobuf_Struct_FieldsEntry* = ref google_protobuf_Struct_FieldsEntryObj
    google_protobuf_Struct_FieldsEntryObj* = object of RootObj
        hasField: IntSet
        key: string
        value: google_protobuf_Value
    google_protobuf_Value* = ref google_protobuf_ValueObj
    google_protobuf_ValueObj* = object of RootObj
        hasField: IntSet
        kind: google_protobuf_Value_kind_OneOf

    google_protobuf_Value_kind_OneOf* {.union.} = object
        null_value: google_protobuf_NullValue
        number_value: float64
        string_value: string
        bool_value: bool
        struct_value: google_protobuf_Struct
        list_value: google_protobuf_ListValue
    google_protobuf_ListValue* = ref google_protobuf_ListValueObj
    google_protobuf_ListValueObj* = object of RootObj
        hasField: IntSet
        values: seq[google_protobuf_Value]

proc readgoogle_protobuf_NullValue*(stream: ProtobufStream): google_protobuf_NullValue =
    google_protobuf_NullValue(readUInt32(stream))

proc writegoogle_protobuf_NullValue*(stream: ProtobufStream, value: google_protobuf_NullValue) =
    writeUInt32(stream, uint32(value))

proc writegoogle_protobuf_NullValue*(stream: ProtobufStream, value: google_protobuf_NullValue, fieldNumber: int) =
    writeUInt32(stream, uint32(value), fieldNumber)

proc sizeOfgoogle_protobuf_NullValue*(value: google_protobuf_NullValue): uint64 =
    sizeOfUInt32(uint32(value))

proc writegoogle_protobuf_Struct_FieldsEntryKV(stream: ProtobufStream, key: string, value: google_protobuf_Value)
proc readgoogle_protobuf_Struct_FieldsEntryKV(stream: ProtobufStream, tbl: TableRef[string, google_protobuf_Value])
proc sizeOfgoogle_protobuf_Struct_FieldsEntryKV(key: string, value: google_protobuf_Value): uint64

proc newgoogle_protobuf_Struct*(): google_protobuf_Struct
proc writegoogle_protobuf_Struct*(stream: ProtobufStream, message: google_protobuf_Struct)
proc readgoogle_protobuf_Struct*(stream: ProtobufStream): google_protobuf_Struct
proc sizeOfgoogle_protobuf_Struct*(message: google_protobuf_Struct): uint64

proc newgoogle_protobuf_ListValue*(): google_protobuf_ListValue
proc writegoogle_protobuf_ListValue*(stream: ProtobufStream, message: google_protobuf_ListValue)
proc readgoogle_protobuf_ListValue*(stream: ProtobufStream): google_protobuf_ListValue
proc sizeOfgoogle_protobuf_ListValue*(message: google_protobuf_ListValue): uint64

proc newgoogle_protobuf_Value*(): google_protobuf_Value
proc writegoogle_protobuf_Value*(stream: ProtobufStream, message: google_protobuf_Value)
proc readgoogle_protobuf_Value*(stream: ProtobufStream): google_protobuf_Value
proc sizeOfgoogle_protobuf_Value*(message: google_protobuf_Value): uint64

proc sizeOfgoogle_protobuf_Struct_FieldsEntryKV(key: string, value: google_protobuf_Value): uint64 =
    result = result + sizeOfTag(1, WireType.LengthDelimited)
    result = result + sizeOfString(key)
    result = result + sizeOfTag(2, WireType.LengthDelimited)
    result = result + sizeOfLengthDelimited(sizeOfgoogle_protobuf_Value(value))

proc writegoogle_protobuf_Struct_FieldsEntryKV(stream: ProtobufStream, key: string, value: google_protobuf_Value) =
    writeString(stream, key, 1)
    writeMessage(stream, value, 2)

proc readgoogle_protobuf_Struct_FieldsEntryKV(stream: ProtobufStream, tbl: TableRef[string, google_protobuf_Value]) =
    var
        key: string
        gotKey = false
        value: google_protobuf_Value
        gotValue = false
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 1:
            key = readString(stream)
            gotKey = true
        of 2:
            let
                size = readVarint(stream)
                data = safeReadStr(stream, int(size))
                pbs = newProtobufStream(newStringStream(data))
            value = readgoogle_protobuf_Value(pbs)
            gotValue = true
        else: skipField(stream, wireType)
    if not gotKey:
        raise newException(Exception, "missing key (google_protobuf_Struct_FieldsEntry)")
    if not gotValue:
        raise newException(Exception, "missing value (google_protobuf_Struct_FieldsEntry)")
    tbl[key] = value


proc newgoogle_protobuf_Struct*(): google_protobuf_Struct =
    new(result)
    result.hasField = initIntSet()
    result.fields = newTable[string, google_protobuf_Value]()

proc clearfields*(message: google_protobuf_Struct) =
    message.fields = newTable[string, google_protobuf_Value]()
    excl(message.hasField, [1])

proc hasfields*(message: google_protobuf_Struct): bool =
    result = contains(message.hasField, 1) or (len(message.fields) > 0)

proc setfields*(message: google_protobuf_Struct, value: TableRef[string, google_protobuf_Value]) =
    message.fields = value
    incl(message.hasField, 1)

proc fields*(message: google_protobuf_Struct): TableRef[string, google_protobuf_Value] {.inline.} =
    message.fields

proc `fields=`*(message: google_protobuf_Struct, value: TableRef[string, google_protobuf_Value]) {.inline.} =
    setfields(message, value)

proc sizeOfgoogle_protobuf_Struct*(message: google_protobuf_Struct): uint64 =
    if hasfields(message):
        var sizeOfKV = 0'u64
        for key, value in message.fields:
            sizeOfKV = sizeOfKV + sizeOfgoogle_protobuf_Struct_FieldsEntryKV(key, value)
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfLengthDelimited(sizeOfKV)

proc writegoogle_protobuf_Struct*(stream: ProtobufStream, message: google_protobuf_Struct) =
    for key, value in message.fields:
        writeTag(stream, 1, WireType.LengthDelimited)
        writeVarint(stream, sizeOfgoogle_protobuf_Struct_FieldsEntryKV(key, value))
        writegoogle_protobuf_Struct_FieldsEntryKV(stream, key, value)

proc readgoogle_protobuf_Struct*(stream: ProtobufStream): google_protobuf_Struct =
    result = newgoogle_protobuf_Struct()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            let
                size = readVarint(stream)
                data = safeReadStr(stream, int(size))
                pbs = newProtobufStream(newStringStream(data))
            readgoogle_protobuf_Struct_FieldsEntryKV(pbs, result.fields)
        else: skipField(stream, wireType)

proc serialize*(message: google_protobuf_Struct): string =
    let
        ss = newStringStream()
        pbs = newProtobufStream(ss)
    writegoogle_protobuf_Struct(pbs, message)
    result = ss.data

proc newgoogle_protobuf_Struct*(data: string): google_protobuf_Struct =
    let
        ss = newStringStream(data)
        pbs = newProtobufStream(ss)
    result = readgoogle_protobuf_Struct(pbs)


proc newgoogle_protobuf_ListValue*(): google_protobuf_ListValue =
    new(result)
    result.hasField = initIntSet()
    result.values = @[]

proc clearvalues*(message: google_protobuf_ListValue) =
    message.values = @[]
    excl(message.hasField, [1])

proc hasvalues*(message: google_protobuf_ListValue): bool =
    result = contains(message.hasField, 1) or (len(message.values) > 0)

proc setvalues*(message: google_protobuf_ListValue, value: seq[google_protobuf_Value]) =
    message.values = value
    incl(message.hasField, 1)

proc addvalues*(message: google_protobuf_ListValue, value: google_protobuf_Value) =
    add(message.values, value)
    incl(message.hasField, 1)

proc values*(message: google_protobuf_ListValue): seq[google_protobuf_Value] {.inline.} =
    message.values

proc `values=`*(message: google_protobuf_ListValue, value: seq[google_protobuf_Value]) {.inline.} =
    setvalues(message, value)

proc sizeOfgoogle_protobuf_ListValue*(message: google_protobuf_ListValue): uint64 =
    for value in message.values:
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfLengthDelimited(sizeOfgoogle_protobuf_Value(value))

proc writegoogle_protobuf_ListValue*(stream: ProtobufStream, message: google_protobuf_ListValue) =
    for value in message.values:
        writeMessage(stream, value, 1)

proc readgoogle_protobuf_ListValue*(stream: ProtobufStream): google_protobuf_ListValue =
    result = newgoogle_protobuf_ListValue()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            let
                size = readVarint(stream)
                data = safeReadStr(stream, int(size))
                pbs = newProtobufStream(newStringStream(data))
            addvalues(result, readgoogle_protobuf_Value(pbs))
        else: skipField(stream, wireType)

proc serialize*(message: google_protobuf_ListValue): string =
    let
        ss = newStringStream()
        pbs = newProtobufStream(ss)
    writegoogle_protobuf_ListValue(pbs, message)
    result = ss.data

proc newgoogle_protobuf_ListValue*(data: string): google_protobuf_ListValue =
    let
        ss = newStringStream(data)
        pbs = newProtobufStream(ss)
    result = readgoogle_protobuf_ListValue(pbs)


proc newgoogle_protobuf_Value*(): google_protobuf_Value =
    new(result)
    result.hasField = initIntSet()
    result.kind.null_value = google_protobuf_NullValue(0)
    result.kind.number_value = 0
    result.kind.string_value = ""
    result.kind.bool_value = false
    result.kind.struct_value = nil
    result.kind.list_value = nil

proc clearnull_value*(message: google_protobuf_Value) =
    message.kind.null_value = google_protobuf_NullValue(0)
    excl(message.hasField, [1, 2, 3, 4, 5, 6])

proc hasnull_value*(message: google_protobuf_Value): bool =
    result = contains(message.hasField, 1)

proc setnull_value*(message: google_protobuf_Value, value: google_protobuf_NullValue) =
    message.kind.null_value = value
    incl(message.hasField, 1)
    excl(message.hasField, [2, 3, 4, 5, 6])

proc null_value*(message: google_protobuf_Value): google_protobuf_NullValue {.inline.} =
    message.kind.null_value

proc `null_value=`*(message: google_protobuf_Value, value: google_protobuf_NullValue) {.inline.} =
    setnull_value(message, value)

proc clearnumber_value*(message: google_protobuf_Value) =
    message.kind.number_value = 0
    excl(message.hasField, [2, 1, 3, 4, 5, 6])

proc hasnumber_value*(message: google_protobuf_Value): bool =
    result = contains(message.hasField, 2)

proc setnumber_value*(message: google_protobuf_Value, value: float64) =
    message.kind.number_value = value
    incl(message.hasField, 2)
    excl(message.hasField, [1, 3, 4, 5, 6])

proc number_value*(message: google_protobuf_Value): float64 {.inline.} =
    message.kind.number_value

proc `number_value=`*(message: google_protobuf_Value, value: float64) {.inline.} =
    setnumber_value(message, value)

proc clearstring_value*(message: google_protobuf_Value) =
    message.kind.string_value = ""
    excl(message.hasField, [3, 1, 2, 4, 5, 6])

proc hasstring_value*(message: google_protobuf_Value): bool =
    result = contains(message.hasField, 3)

proc setstring_value*(message: google_protobuf_Value, value: string) =
    message.kind.string_value = value
    incl(message.hasField, 3)
    excl(message.hasField, [1, 2, 4, 5, 6])

proc string_value*(message: google_protobuf_Value): string {.inline.} =
    message.kind.string_value

proc `string_value=`*(message: google_protobuf_Value, value: string) {.inline.} =
    setstring_value(message, value)

proc clearbool_value*(message: google_protobuf_Value) =
    message.kind.bool_value = false
    excl(message.hasField, [4, 1, 2, 3, 5, 6])

proc hasbool_value*(message: google_protobuf_Value): bool =
    result = contains(message.hasField, 4)

proc setbool_value*(message: google_protobuf_Value, value: bool) =
    message.kind.bool_value = value
    incl(message.hasField, 4)
    excl(message.hasField, [1, 2, 3, 5, 6])

proc bool_value*(message: google_protobuf_Value): bool {.inline.} =
    message.kind.bool_value

proc `bool_value=`*(message: google_protobuf_Value, value: bool) {.inline.} =
    setbool_value(message, value)

proc clearstruct_value*(message: google_protobuf_Value) =
    message.kind.struct_value = nil
    excl(message.hasField, [5, 1, 2, 3, 4, 6])

proc hasstruct_value*(message: google_protobuf_Value): bool =
    result = contains(message.hasField, 5)

proc setstruct_value*(message: google_protobuf_Value, value: google_protobuf_Struct) =
    message.kind.struct_value = value
    incl(message.hasField, 5)
    excl(message.hasField, [1, 2, 3, 4, 6])

proc struct_value*(message: google_protobuf_Value): google_protobuf_Struct {.inline.} =
    message.kind.struct_value

proc `struct_value=`*(message: google_protobuf_Value, value: google_protobuf_Struct) {.inline.} =
    setstruct_value(message, value)

proc clearlist_value*(message: google_protobuf_Value) =
    message.kind.list_value = nil
    excl(message.hasField, [6, 1, 2, 3, 4, 5])

proc haslist_value*(message: google_protobuf_Value): bool =
    result = contains(message.hasField, 6)

proc setlist_value*(message: google_protobuf_Value, value: google_protobuf_ListValue) =
    message.kind.list_value = value
    incl(message.hasField, 6)
    excl(message.hasField, [1, 2, 3, 4, 5])

proc list_value*(message: google_protobuf_Value): google_protobuf_ListValue {.inline.} =
    message.kind.list_value

proc `list_value=`*(message: google_protobuf_Value, value: google_protobuf_ListValue) {.inline.} =
    setlist_value(message, value)

proc sizeOfgoogle_protobuf_Value*(message: google_protobuf_Value): uint64 =
    if hasnull_value(message):
        result = result + sizeOfTag(1, WireType.Varint)
        result = result + sizeOfgoogle_protobuf_NullValue(message.kind.null_value)
    if hasnumber_value(message):
        result = result + sizeOfTag(2, WireType.Fixed64)
        result = result + sizeOfDouble(message.kind.number_value)
    if hasstring_value(message):
        result = result + sizeOfTag(3, WireType.LengthDelimited)
        result = result + sizeOfString(message.kind.string_value)
    if hasbool_value(message):
        result = result + sizeOfTag(4, WireType.Varint)
        result = result + sizeOfBool(message.kind.bool_value)
    if hasstruct_value(message):
        result = result + sizeOfTag(5, WireType.LengthDelimited)
        result = result + sizeOfLengthDelimited(sizeOfgoogle_protobuf_Struct(message.kind.struct_value))
    if haslist_value(message):
        result = result + sizeOfTag(6, WireType.LengthDelimited)
        result = result + sizeOfLengthDelimited(sizeOfgoogle_protobuf_ListValue(message.kind.list_value))

proc writegoogle_protobuf_Value*(stream: ProtobufStream, message: google_protobuf_Value) =
    if hasnull_value(message):
        writegoogle_protobuf_NullValue(stream, message.kind.null_value, 1)
    if hasnumber_value(message):
        writeDouble(stream, message.kind.number_value, 2)
    if hasstring_value(message):
        writeString(stream, message.kind.string_value, 3)
    if hasbool_value(message):
        writeBool(stream, message.kind.bool_value, 4)
    if hasstruct_value(message):
        writeMessage(stream, message.kind.struct_value, 5)
    if haslist_value(message):
        writeMessage(stream, message.kind.list_value, 6)

proc readgoogle_protobuf_Value*(stream: ProtobufStream): google_protobuf_Value =
    result = newgoogle_protobuf_Value()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.Varint)
            setnull_value(result, readgoogle_protobuf_NullValue(stream))
        of 2:
            expectWireType(wireType, WireType.Fixed64)
            setnumber_value(result, readDouble(stream))
        of 3:
            expectWireType(wireType, WireType.LengthDelimited)
            setstring_value(result, readString(stream))
        of 4:
            expectWireType(wireType, WireType.Varint)
            setbool_value(result, readBool(stream))
        of 5:
            expectWireType(wireType, WireType.LengthDelimited)
            let
                size = readVarint(stream)
                data = safeReadStr(stream, int(size))
                pbs = newProtobufStream(newStringStream(data))
            setstruct_value(result, readgoogle_protobuf_Struct(pbs))
        of 6:
            expectWireType(wireType, WireType.LengthDelimited)
            let
                size = readVarint(stream)
                data = safeReadStr(stream, int(size))
                pbs = newProtobufStream(newStringStream(data))
            setlist_value(result, readgoogle_protobuf_ListValue(pbs))
        else: skipField(stream, wireType)

proc serialize*(message: google_protobuf_Value): string =
    let
        ss = newStringStream()
        pbs = newProtobufStream(ss)
    writegoogle_protobuf_Value(pbs, message)
    result = ss.data

proc newgoogle_protobuf_Value*(data: string): google_protobuf_Value =
    let
        ss = newStringStream(data)
        pbs = newProtobufStream(ss)
    result = readgoogle_protobuf_Value(pbs)

