import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getDateMessage;

class DateMaxRule extends Rule {
  DateMaxRule(this.max, {message})
      : super(message: message ?? getDateMessage('max'));

  final DateTime max;

  @override
  get params => {'path': path, 'max': max};

  @override
  bool test(value, {Map params}) {
    DateTime datetimeVal;
    if (value is DateTime) {
      datetimeVal = value;
    } else {
      datetimeVal = DateTime.tryParse(value);
    }
    return isAbsent(value) || datetimeVal.isBefore(max);
  }
}
