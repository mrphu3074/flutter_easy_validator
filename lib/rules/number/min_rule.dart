import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberMinRule extends Rule {
  NumberMinRule(this.min, {message})
      : super(message: message ?? getNumberMessage('min'));

  final num min;

  @override
  get params => {'path': path, 'min': min};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value >= min;
  }
}
