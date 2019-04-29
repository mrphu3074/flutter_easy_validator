import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getNumberMessage;

class NumberLessThanRule extends Rule {
  NumberLessThanRule(this.lessThan, {message})
      : super(message: message ?? getNumberMessage('lessThan'));

  final num lessThan;

  @override
  get params => {'path': path, 'lessThan': lessThan};

  @override
  bool test(value, {Map params}) {
    return isAbsent(value) || value < lessThan;
  }
}
