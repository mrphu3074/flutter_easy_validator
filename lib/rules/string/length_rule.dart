import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getStringMessage;

class StringLengthRule extends Rule {
  StringLengthRule(this.length, {message})
      : super(message: message ?? getStringMessage('length'));

  final int length;

  @override
  get params => {'path': path, 'length': length};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is String && value.length == length);
  }
}
