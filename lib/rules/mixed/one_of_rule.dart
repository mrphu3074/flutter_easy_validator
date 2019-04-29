import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getMixedMessage;

class OneOfRule extends Rule {
  OneOfRule(this.values, {message})
      : super(message: message ?? getMixedMessage('oneOf'));

  final List values;

  @override
  get params => {'path': path, 'values': values};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || values.contains(value);
  }
}
