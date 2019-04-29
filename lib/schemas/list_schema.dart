import 'package:easy_validator/base/schema.dart';
import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/rules/list/max_rule.dart';
import 'package:easy_validator/rules/list/min_rule.dart';

class ListSchema extends Schema {
  Schema _elementShape;

  bool typeCheck(value) {
    if (value != null) {
      return value is List;
    }
    return true;
  }

  @override
  bool isPresent(value) {
    if (value is List) {
      return value.length > 0;
    }
    return value != null;
  }

  ListSchema of(Schema schema) {
    _elementShape = schema;
    return this;
  }

  @override
  validate(value) {
    for (Rule rule in rules) {
      rule.path = label ?? path;
      if (!rule.test(value)) {
        return rule.message;
      }
    }

    if (_elementShape != null) {
      Map errors = {};
      for (int i = 0; i < value.length; i++) {
        _elementShape.path = "$path.$i";
        var err = _elementShape.validate(value[i]);
        if (err != null) {
          if (err is String) {
            errors[i] = err;
          }
          if (err is Map && err.keys.length > 0) {
            errors[i] = err;
          }
        }
      }
      return errors;
    }
    return null;
  }

  void min(int min, {message}) {
    addRule(ListMinRule(min, message: message));
  }

  max(int max, {message}) {
    addRule(ListMaxRule(max, message: message));
  }
}
