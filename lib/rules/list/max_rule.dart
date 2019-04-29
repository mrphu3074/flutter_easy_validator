import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getListMessage;

class ListMaxRule extends Rule {
  ListMaxRule(this.max, {message})
      : super(message: message ?? getListMessage('max'));

  final int max;

  @override
  get params => {'path': path, 'max': max};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is List && value.length <= max);
  }
}
