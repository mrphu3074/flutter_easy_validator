import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/date/min_rule.dart';

void main() {
  group("DateMinRule", () {
    DateTime min = new DateTime(2019, 1, 1);
    test('valid value', () {
      DateMinRule rule = DateMinRule(min);
      expect(rule.test(new DateTime(2019, 1, 2)), true);
    });

    test('invalid value', () {
      DateMinRule rule = DateMinRule(min);
      rule.path = "dob";
      expect(rule.test(new DateTime(2018, 1, 2)), false);
      expect(rule.message, 'dob field must be later than ${min.toString()}');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      DateMinRule rule = DateMinRule(min, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
