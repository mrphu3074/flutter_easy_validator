import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getMixedMessage;

typedef bool TypeCheck(value);

class TypeRule extends Rule {
  TypeRule(this.typeCheck, {message})
      : super(message: message ?? getMixedMessage('invalid'));

  final TypeCheck typeCheck;

  @override
  bool test(value, {Map params}) {
    return typeCheck(value);
  }
}
