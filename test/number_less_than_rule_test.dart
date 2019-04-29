import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/number/less_than_rule.dart';

void main() {
  group("Number LessThanRule", () {
    test('valid value', () {
      NumberLessThanRule rule = NumberLessThanRule(100);
      expect(rule.test(99), true);
    });

    test('invalid value', () {
      NumberLessThanRule rule = NumberLessThanRule(100);
      rule.path = "age";
      expect(rule.test(100), false);
      expect(rule.message, 'age must be less than 100');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      NumberLessThanRule rule = NumberLessThanRule(6, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
