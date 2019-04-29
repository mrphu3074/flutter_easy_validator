import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberMaxRule<T> extends Rule {
  NumberMaxRule(this.max, {message})
      : super(message: message ?? getNumberMessage('max'));

  final num max;

  @override
  get params => {'path': path, 'max': max};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value <= max;
  }
}
