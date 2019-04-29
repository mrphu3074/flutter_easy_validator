import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/email_rule.dart';

void main() {
  group("EmailRule", () {
    String validEmail = "mrphu3074@gmail.com";
    String customErrMsg = "Custom Error Message";

    test('with valid email address', () {
      EmailRule rule = EmailRule();
      expect(rule.test(validEmail), true);
    });

    test('with invalid email address', () {
      EmailRule rule = EmailRule();
      rule.path = "email";
      expect(rule.test("abc"), false);
      expect(rule.message, "email must be a valid email");
    });

    test('with custom error message', () {
      EmailRule rule = EmailRule(message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
