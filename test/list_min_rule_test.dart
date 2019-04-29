import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/list/min_rule.dart';

void main() {
  group("ListMinRule", () {
    test('valid value', () {
      ListMinRule rule = ListMinRule(2);
      expect(rule.test(["tag1", "tag2"]), true);
    });

    test('invalid value', () {
      ListMinRule rule = ListMinRule(2);
      rule.path = "tags";
      expect(rule.test(["tag1"]), false);
      expect(rule.message, 'tags field must have at least 2 items');
    });

    test('with custom error message', () {
      String customErrMsg = "Custom Error Message";
      ListMinRule rule = ListMinRule(2, message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
