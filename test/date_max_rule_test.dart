import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/date/max_rule.dart';

void main() {
  group("DateMaxRule", () {
    DateTime max = new DateTime(2019, 1, 1);
    test('valid value', () {
      DateMaxRule rule = DateMaxRule(max);
      expect(rule.test(new DateTime(2018, 12, 31)), true);
    });

    test('invalid value', () {
      DateMaxRule rule = DateMaxRule(max);
      rule.path = "dob";
      expect(rule.test(new DateTime(2019, 1, 2)), false);
      expect(
          rule.message, 'dob field must be at earlier than ${max.toString()}');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      DateMaxRule rule = DateMaxRule(max, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
