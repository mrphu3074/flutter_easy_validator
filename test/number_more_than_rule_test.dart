import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/number/more_than_rule.dart';

void main() {
  group("Number MoreThanRule", () {
    test('valid value', () {
      NumberMoreThanRule rule = NumberMoreThanRule(100);
      expect(rule.test(101), true);
    });

    test('invalid value', () {
      NumberMoreThanRule rule = NumberMoreThanRule(100);
      rule.path = "score";
      expect(rule.test(100), false);
      expect(rule.message, 'score must be greater than 100');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      NumberMoreThanRule rule = NumberMoreThanRule(6, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
