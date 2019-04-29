import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getMixedMessage;

class NotOneOfRule extends Rule {
  NotOneOfRule(this.values, {message})
      : super(message: message ?? getMixedMessage('notOneOf'));

  final List values;

  @override
  get params => {'path': path, 'values': values};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || !values.contains(value);
  }
}
