import 'package:easy_validator/base/schema.dart';
import 'package:easy_validator/rules/string/email_rule.dart';
import 'package:easy_validator/rules/string/lowercase_rule.dart';
import 'package:easy_validator/rules/string/pattern_rule.dart';
import 'package:easy_validator/rules/string/length_rule.dart';
import 'package:easy_validator/rules/string/max_rule.dart';
import 'package:easy_validator/rules/string/min_rule.dart';
import 'package:easy_validator/rules/string/uppercase_rule.dart';
import 'package:easy_validator/rules/string/url_rule.dart';

class StringSchema extends Schema {
  @override
  get dataType => String;

  @override
  bool isPresent(value) {
    if (value is String) {
      return value.length > 0;
    }
    return value != null;
  }

  void length(int length, {message}) {
    addRule(StringLengthRule(length, message: message));
  }

  void min(int min, {message}) {
    addRule(StringMinRule(min, message: message));
  }

  void max(int max, {message}) {
    addRule(StringMaxRule(max, message: message));
  }

  void email({message}) {
    addRule(EmailRule(message: message));
  }

  void url({message}) {
    addRule(UrlRule(message: message));
  }

  void lowerCase({message}) {
    addRule(LowerCaseRule(message: message));
  }

  void upperCase({message}) {
    addRule(UpperCaseRule(message: message));
  }

  void pattern(RegExp regex, {message}) {
    addRule(PatternRule(regex, message: message));
  }
}
