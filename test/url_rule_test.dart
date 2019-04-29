import 'package:flutter_test/flutter_test.dart';
import 'package:easy_validator/rules/string/url_rule.dart';

void main() {
  group("UrlRule", () {
    String validSiteUrl = "https://google.com";
    String customErrMsg = "Custom Error Message";

    test('with valid url', () {
      UrlRule rule = UrlRule();
      expect(rule.test(validSiteUrl), true);
    });

    test('with invalid email address', () {
      UrlRule rule = UrlRule();
      rule.path = "website";
      expect(rule.test("http://abc"), false);
      expect(rule.message, "website must be a valid URL");
    });

    test('with custom error message', () {
      UrlRule rule = UrlRule(message: customErrMsg);
      expect(rule.message, customErrMsg);
    });
  });
}
