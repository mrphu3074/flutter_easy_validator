typedef String GetMessageCallback(Map params);

abstract class Rule {
  String path;
  dynamic value;
  GetMessageCallback _getMessage;

  Map get params => {'path': path};

  get message => _getMessage(params);

  Rule({message}) {
    if (message is Function) {
      _getMessage = message;
    } else if (message is String) {
      _getMessage = (params) => message;
    } else {
      _getMessage = (params) => null;
    }
  }

  bool isAbsent(value) {
    return value == null;
  }

  bool test(value);
}
