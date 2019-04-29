import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getStringMessage;

class LowerCaseRule extends Rule {
  LowerCaseRule({message})
      : super(message: message ?? getStringMessage('lowercase'));

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || (value is String && value == value.toLowerCase());
  }
}
