import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/pattern_rule.dart';

void main() {
  group("PatternRule", () {
    RegExp rIP4 = new RegExp(
        r"\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b");

    test('value match to pattern', () {
      PatternRule rule = PatternRule(rIP4);
      expect(rule.test("192.168.1.1"), true);
    });

    test('value not match to pattern', () {
      PatternRule rule = PatternRule(rIP4);
      rule.path = "ip";
      expect(rule.test("192.168"), false);
      expect(rule.message, 'ip must match the following: "${rIP4.toString()}"');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      PatternRule rule = PatternRule(rIP4, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
