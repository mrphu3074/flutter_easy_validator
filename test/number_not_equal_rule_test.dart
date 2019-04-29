import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/number/positive_rule.dart';

void main() {
  group("Number NotEqualRule", () {
    test('valid value', () {
      NumberPositiveRule rule = NumberPositiveRule();
      expect(rule.test(1), true);
    });

    test('invalid value', () {
      NumberPositiveRule rule = NumberPositiveRule();
      rule.path = "field1";
      expect(rule.test(-1), false);
      expect(rule.message, 'field1 must be a positive number');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      NumberPositiveRule rule = NumberPositiveRule(message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
