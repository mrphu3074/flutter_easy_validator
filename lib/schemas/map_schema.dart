import 'package:easy_validator/base/schema.dart';

class MapSchema extends Schema {
  Map _shape;

  bool typeCheck(value) {
    if (value != null) {
      return value is Map;
    }
    return true;
  }

  @override
  bool isPresent(value) {
    if (value is Map) {
      return value.keys.length > 0;
    }
    return value != null;
  }

  MapSchema shape(Map schema) {
    _shape = schema;
    return this;
  }

  @override
  validate(value) {
    if (_shape == null || value is Map == false) {
      return super.validate(value);
    }
    if (value is Map) {
      Map errors = {};
      _shape.forEach((key, schema) {
        var val = value[key];
        if (schema is Schema) {
          if (schema is MapSchema) {
            schema.path = key;
            var err = schema.validate(val);
            if (err is String) {
              errors[key] = err;
            }
            if (err is Map && err.keys.length > 0) {
              errors[key] = err;
            }
          } else {
            schema.path = key;
            var err = schema.validate(val);
            if (err != null) {
              if (err is String) {
                errors[key] = err;
              }
              if (err is Map && err.keys.length > 0) {
                errors[key] = err;
              }
            }
          }
        }
      });
      return errors;
    }
  }
}
