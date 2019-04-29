import 'package:easy_validator/base/rule.dart';
import 'package:easy_validator/messages.dart' show getMixedMessage;

typedef bool IsPresent(value);

class RequiredRule extends Rule {
  RequiredRule(this.isPresent, {message})
      : super(message: message ?? getMixedMessage('required'));

  final IsPresent isPresent;

  @override
  Map get params => {'path': path};

  @override
  bool test(value, {Map params}) {
    return isPresent(value);
  }
}
