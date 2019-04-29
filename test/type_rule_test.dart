import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/mixed/type_rule.dart';

void main() {
  group("TypeRule", () {
    bool isStringType(value) => value is String;
    String validData = "Hello world";
    int invalidData = 12345;
    String customErrMsg = "Custom Error Message";

    test('with valid data', () {
      TypeRule typeCheckRule = TypeRule(isStringType);
      expect(typeCheckRule.test(validData), true);
    });

    test('with invalid data', () {
      TypeRule typeCheckRule = TypeRule(isStringType);
      typeCheckRule.path = "name";
      expect(typeCheckRule.test(invalidData), false);
      expect(typeCheckRule.message, "name is invalid");
    });

    test('with custom error message', () {
      TypeRule typeCheckRule = TypeRule(isStringType, message: customErrMsg);
      expect(typeCheckRule.message, customErrMsg);
    });
  });
}
