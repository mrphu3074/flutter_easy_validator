import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getDateMessage;

class DateMinRule extends Rule {
  DateMinRule(this.min, {message})
      : super(message: message ?? getDateMessage('min'));

  final DateTime min;

  @override
  get params => {'path': path, 'min': min};

  @override
  bool test(value, {Map params}) {
    DateTime datetimeVal;
    if (value is DateTime) {
      datetimeVal = value;
    } else {
      datetimeVal = DateTime.tryParse(value);
    }
    return isAbsent(value) || datetimeVal.isAfter(min);
  }
}
