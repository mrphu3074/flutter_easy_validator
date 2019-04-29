import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/min_rule.dart';

void main() {
  group("StringMinRule", () {
    test('valid value', () {
      StringMinRule rule = StringMinRule(6);
      expect(rule.test("123456"), true);
    });

    test('invalid value', () {
      StringMinRule rule = StringMinRule(6);
      rule.path = "password";
      expect(rule.test("12345"), false);
      expect(rule.message, 'password must be at least 6 characters');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      StringMinRule rule = StringMinRule(6, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
