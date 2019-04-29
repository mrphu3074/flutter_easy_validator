import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/rules/mixed/not_one_of_rule.dart';
import 'package:easy_validator/rules/mixed/one_of_rule.dart';
import 'package:easy_validator/rules/mixed/required_rule.dart';
import 'package:easy_validator/rules/mixed/type_rule.dart';

abstract class Schema {
  dynamic dataType;
  String label;

  dynamic value;
  String path;
  List<Rule> rules = [];

  Schema() {
    rules = [];
    rules.add(TypeRule(typeCheck));
  }

  bool typeCheck(value) {
    if (value != null) {
      return value.runtimeType == dataType;
    }
    return true;
  }

  bool isPresent(value) {
    return value != null;
  }

  validate(value) {
    for (Rule rule in rules) {
      rule.path = label ?? path;
      if (!rule.test(value)) {
        return rule.message;
      }
    }
    return null;
  }

  bool isValid(value) {
    return validate(value) == null;
  }

  bool hasRule(Rule rule) {
    for (Rule r in rules) {
      if (r.runtimeType == rule.runtimeType) return true;
    }
    return false;
  }

  addRule(Rule rule) {
    if (!hasRule(rule)) {
      rules.add(rule);
    }
  }

  void required({message}) {
    addRule(RequiredRule(isPresent, message: message));
  }

  void oneOf(List values, {message}) {
    addRule(OneOfRule(values, message: message));
  }

  void notOneOf(List values, {message}) {
    addRule(NotOneOfRule(values, message: message));
  }
}
