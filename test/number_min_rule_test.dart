import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/number/not_equal_rule.dart';

void main() {
  group("Number MinRule", () {
    test('valid value', () {
      NumberNotEqualRule rule = NumberNotEqualRule(8);
      expect(rule.test(7), true);
    });

    test('invalid value', () {
      NumberNotEqualRule rule = NumberNotEqualRule(8);
      rule.path = "field1";
      expect(rule.test(8), false);
      expect(rule.message, 'field1 must be not equal to 8');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      NumberNotEqualRule rule = NumberNotEqualRule(6, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
