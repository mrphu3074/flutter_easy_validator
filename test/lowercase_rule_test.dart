import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/lowercase_rule.dart';

void main() {
  group("StringLowerCaseRule", () {
    test('with valid data', () {
      LowerCaseRule rule = LowerCaseRule();
      expect(rule.test("this is lower string"), true);
    });

    test('with invalid data', () {
      LowerCaseRule rule = LowerCaseRule();
      rule.path = "street";
      expect(rule.test("This Is Invalid Data"), false);
      expect(rule.message, "street must be a lowercase string");
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      LowerCaseRule rule = LowerCaseRule(message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
