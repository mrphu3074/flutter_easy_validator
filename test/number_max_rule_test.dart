import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/number/max_rule.dart';

void main() {
  group("Number MaxRule", () {
    test('valid value', () {
      NumberMaxRule rule = NumberMaxRule(100);
      expect(rule.test(100), true);
    });

    test('invalid value', () {
      NumberMaxRule rule = NumberMaxRule(100);
      rule.path = "age";
      expect(rule.test(101), false);
      expect(rule.message, 'age must be less than or equal to 100');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      NumberMaxRule rule = NumberMaxRule(6, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
