import 'package:easy_validator/base/schema.dart';
import 'package:easy_validator/rules/number/less_than_rule.dart';
import 'package:easy_validator/rules/number/max_rule.dart';
import 'package:easy_validator/rules/number/min_rule.dart';
import 'package:easy_validator/rules/number/more_than_rule.dart';
import 'package:easy_validator/rules/number/negative_rule.dart';
import 'package:easy_validator/rules/number/not_equal_rule.dart';
import 'package:easy_validator/rules/number/positive_rule.dart';

class NumberSchema<T extends num> extends Schema {
  @override
  get dataType => T;

  @override
  bool isPresent(value) {
    return value != null;
  }

  void min(num min, {message}) {
    addRule(NumberMinRule(min, message: message));
  }

  void max(num max, {message}) {
    addRule(NumberMaxRule(max, message: message));
  }

  void lessThan(num lessThan, {message}) {
    addRule(NumberLessThanRule(lessThan, message: message));
  }

  void moreThan(num moreThan, {message}) {
    addRule(NumberMoreThanRule(moreThan, message: message));
  }

  void notEqual(num notEqual, {message}) {
    addRule(NumberNotEqualRule(notEqual, message: message));
  }

  void positive({message}) {
    addRule(NumberPositiveRule(message: message));
  }

  void negative({message}) {
    addRule(NumberNegativeRule(message: message));
  }
}
