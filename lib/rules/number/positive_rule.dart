import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberPositiveRule extends Rule {
  NumberPositiveRule({message})
      : super(message: message ?? getNumberMessage('positive'));

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value > 0;
  }
}
