import 'package:easy_validator/base/schema.dart';
import 'package:easy_validator/rules/date/max_rule.dart';
import 'package:easy_validator/rules/date/min_rule.dart';

class DateTimeSchema extends Schema {
  @override
  get dataType => DateTime;

  @override
  bool typeCheck(value) {
    if (value != null && value is DateTime == false) {
      return DateTime.tryParse(value) is DateTime;
    }
    return true;
  }

  @override
  bool isPresent(value) {
    return value != null;
  }

  void min(DateTime min, {message}) {
    addRule(DateMinRule(min, message: message));
  }

  void max(DateTime max, {message}) {
    addRule(DateMaxRule(max, message: message));
  }
}
