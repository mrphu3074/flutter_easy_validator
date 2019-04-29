import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberNegativeRule extends Rule {
  NumberNegativeRule({message})
      : super(message: message ?? getNumberMessage('negative'));

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value < 0;
  }
}
