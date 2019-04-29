import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/max_rule.dart';

void main() {
  group("StringMaxRule", () {
    test('valid value', () {
      StringMaxRule rule = StringMaxRule(6);
      expect(rule.test("1234"), true);
    });

    test('invalid value', () {
      StringMaxRule rule = StringMaxRule(6);
      rule.path = "password";
      expect(rule.test("1234567"), false);
      expect(rule.message, 'password must be at most 6 characters');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      StringMaxRule rule = StringMaxRule(6, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
