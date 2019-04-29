import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/length_rule.dart';

void main() {
  group("StringLengthRule", () {
    test('valid value', () {
      StringLengthRule rule = StringLengthRule(6);
      expect(rule.test("123456"), true);
    });

    test('invalid value', () {
      StringLengthRule rule = StringLengthRule(6);
      rule.path = "zip";
      expect(rule.test("12345"), false);
      expect(rule.message, 'zip must be exactly 6 characters');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      StringLengthRule rule = StringLengthRule(6);
      expect(rule.message, customErrMsg);
    });
  });
}
