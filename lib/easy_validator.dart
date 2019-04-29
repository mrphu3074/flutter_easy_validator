library easy_validator;

import 'schemas/bool_schema.dart';
import 'schemas/double_schema.dart';
import 'schemas/int_schema.dart';
import 'schemas/list_schema.dart';
import 'schemas/map_schema.dart';
import 'schemas/string_schema.dart';
import 'schemas/datetime_schema.dart';

MapSchema map() {
  return MapSchema();
}

StringSchema string() {
  return StringSchema();
}

IntSchema int() {
  return IntSchema();
}

DoubleSchema double() {
  return DoubleSchema();
}

BoolSchema bool() {
  return BoolSchema();
}

ListSchema list() {
  return ListSchema();
}

DateTimeSchema date() {
  return DateTimeSchema();
}
