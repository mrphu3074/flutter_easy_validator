import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/number/negative_rule.dart';

void main() {
  group("Number NegativeRule", () {
    test('valid value', () {
      NumberNegativeRule rule = NumberNegativeRule();
      expect(rule.test(-1), true);
    });

    test('invalid value', () {
      NumberNegativeRule rule = NumberNegativeRule();
      rule.path = "field1";
      expect(rule.test(0), false);
      expect(rule.message, 'field1 must be a negative number');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      NumberNegativeRule rule = NumberNegativeRule(message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
