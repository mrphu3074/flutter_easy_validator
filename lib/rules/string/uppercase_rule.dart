import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getStringMessage;

class UpperCaseRule extends Rule {
  UpperCaseRule({message})
      : super(message: message ?? getStringMessage('uppercase'));

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is String && value == value.toUpperCase());
  }
}
