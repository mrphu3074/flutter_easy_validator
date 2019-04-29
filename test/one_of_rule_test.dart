import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/mixed/one_of_rule.dart';

void main() {
  group("OneOfRule", () {
    List values = ["male", "female"];
    String customErrMsg = "Custom Error Message";

    test('with valid value', () {
      OneOfRule rule = OneOfRule(values);
      expect(rule.test("male"), true);
    });

    test('with value not contains in valid values', () {
      OneOfRule rule = OneOfRule(values);
      rule.path = "gender";
      expect(rule.test("nam"), false);
      expect(
          rule.message,
          "gender must be one of the following values: "
          "${values.toString()}");
    });

    test('with custom error message', () {
      OneOfRule rule = OneOfRule(values, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
