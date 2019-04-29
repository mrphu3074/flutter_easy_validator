import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberMoreThanRule extends Rule {
  NumberMoreThanRule(this.moreThan, {message})
      : super(message: message ?? getNumberMessage('moreThan'));

  final num moreThan;

  get params => {'path': path, 'moreThan': moreThan};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value > moreThan;
  }
}
