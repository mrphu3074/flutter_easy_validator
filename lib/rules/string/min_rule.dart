import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getStringMessage;

class StringMinRule extends Rule {
  StringMinRule(this.min, {message})
      : super(message: message ?? getStringMessage('min'));

  final int min;

  @override
  get params => {'path': path, 'min': min};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is String && value.length >= min);
  }
}
