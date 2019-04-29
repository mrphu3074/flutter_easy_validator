import 'package:easy_validator/base/schema.dart';

class BoolSchema extends Schema {
  @override
  get dataType => bool;

  @override
  bool isPresent(value) {
    return value != null;
  }
}
