import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/uppercase_rule.dart';

void main() {
  group("StringUpperCaseRule", () {
    test('with valid data', () {
      UpperCaseRule rule = UpperCaseRule();
      expect(rule.test("THIS IS UPPER CASE STRING"), true);
    });

    test('with invalid data', () {
      UpperCaseRule rule = UpperCaseRule();
      rule.path = "street";
      expect(rule.test("This Is Invalid Data"), false);
      expect(rule.message, "street must be a upper case string");
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      UpperCaseRule rule = UpperCaseRule(message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
