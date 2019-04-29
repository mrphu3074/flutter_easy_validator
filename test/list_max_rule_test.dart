import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/list/max_rule.dart';

void main() {
  group("ListMaxRule", () {
    test('valid value', () {
      ListMaxRule rule = ListMaxRule(2);
      expect(rule.test(["tag1", "tag2"]), true);
    });

    test('invalid value', () {
      ListMaxRule rule = ListMaxRule(2);
      rule.path = "tags";
      expect(rule.test(["tag1", "tag2", "tag3"]), false);
      expect(
          rule.message, 'tags field must have less than or equal to 2 items');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      ListMaxRule rule = ListMaxRule(2, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
