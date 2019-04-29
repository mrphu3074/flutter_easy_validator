import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getListMessage;

class ListMinRule extends Rule {
  ListMinRule(this.min, {message})
      : super(message: message ?? getListMessage('min'));

  final int min;

  @override
  get params => {'path': path, 'min': min};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is List && value.length >= min);
  }
}
