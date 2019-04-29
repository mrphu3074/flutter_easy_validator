import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/mixed/required_rule.dart';

void main() {
  group("RequiredRule", () {
    bool isPresent(value) => value != null;
    String validData = "Hello world";
    String customErrMsg = "Custom Error Message";

    test('with value', () {
      RequiredRule rule = RequiredRule(isPresent);
      expect(rule.test(validData), true);
    });

    test('with empty data', () {
      RequiredRule rule = RequiredRule(isPresent);
      rule.path = "name";
      expect(rule.test(null), false);
      expect(rule.message, "name is a required field");
    });

    test('with custom error message', () {
      RequiredRule rule = RequiredRule(isPresent, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
