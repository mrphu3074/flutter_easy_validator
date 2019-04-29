import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/mixed/not_one_of_rule.dart';

void main() {
  group("NotOneOfRule", () {
    List values = ["male", "female"];
    String customErrMsg = "Custom Error Message";

    test('with valid value', () {
      NotOneOfRule rule = NotOneOfRule(values);
      expect(rule.test("nam"), true);
    });

    test('with value contains in valid values', () {
      NotOneOfRule rule = NotOneOfRule(values);
      rule.path = "gender";
      expect(rule.test("male"), false);
      expect(
          rule.message,
          "gender must not be one of the following values: "
          "${values.toString()}");
    });

    test('with custom error message', () {
      NotOneOfRule rule = NotOneOfRule(values, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
