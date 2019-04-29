import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getStringMessage;

class StringMaxRule extends Rule {
  StringMaxRule(this.max, {message})
      : super(message: message ?? getStringMessage('max'));

  final int max;

  @override
  get params => {'path': path, 'max': max};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is String && value.length <= max);
  }
}
