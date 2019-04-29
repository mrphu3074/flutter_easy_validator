import 'package:meta/meta.dart';
import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberNotEqualRule extends Rule {
  NumberNotEqualRule(this.notEqual, {message})
      : super(message: message ?? getNumberMessage('notEqual'));

  final num notEqual;

  @override
  get params => {'path': path, 'notEqual': notEqual};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value != notEqual;
  }
}
