typedef String GetMessage(Map params);

String getParam(Map params, String key) {
  return params[key].toString();
}

String getPath(Map params) {
  return getParam(params, 'path');
}

Map<String, Map<String, Function>> _messages = {
  'mixed': {
    'invalid': (Map params) => "${params['path'].toString()} is invalid",
    'required': (Map params) =>
        "${params['path'].toString()} is a required field",
    'oneOf': (Map params) =>
        '${getPath(params)} must be one of the following values: ${getParam(params, 'values')}',
    'notOneOf': (Map params) =>
        '${getPath(params)} must not be one of the following values: ${getParam(params, 'values')}',
  },
  'string': {
    'length': (Map params) =>
        "${getPath(params)} must be exactly ${getParam(params, 'length')} characters",
    'min': (Map params) =>
        "${getPath(params)} must be at least ${getParam(params, 'min')} characters",
    'max': (Map params) =>
        "${getPath(params)} must be at most ${getParam(params, 'max')} characters",
    'pattern': (Map params) =>
        "${getPath(params)} must match the following: \"${getParam(params, 'regex')}\"",
    'email': (Map params) => "${getPath(params)} must be a valid email",
    'url': (Map params) => "${getPath(params)} must be a valid URL",
    'trim': (Map params) => "${getPath(params)} must be a trimmed string",
    'lowercase': (Map params) =>
        "${getPath(params)} must be a lowercase string",
    'uppercase': (Map params) =>
        "${getPath(params)} must be a upper case string",
  },
  'number': {
    'min': (Map params) =>
        '${getPath(params)} must be greater than or equal to ${getParam(params, 'min')}',
    'max': (Map params) =>
        '${getPath(params)} must be less than or equal to ${getParam(params, 'max')}',
    'lessThan': (Map params) =>
        '${getPath(params)} must be less than ${getParam(params, 'lessThan')}',
    'moreThan': (Map params) =>
        '${getPath(params)} must be greater than ${getParam(params, 'moreThan')}',
    'notEqual': (Map params) =>
        '${getPath(params)} must be not equal to ${getParam(params, 'notEqual')}',
    'positive': (Map params) => '${getPath(params)} must be a positive number',
    'negative': (Map params) => '${getPath(params)} must be a negative number',
  },
  'bool': {},
  'list': {
    'min': (Map params) =>
        '${getPath(params)} field must have at least ${getParam(params, 'min')} items',
    'max': (Map params) =>
        '${getPath(params)} field must have less than or equal to ${getParam(params, 'max')} items',
  },
  'date': {
    'min': (Map params) =>
        '${getPath(params)} field must be later than ${getParam(params, 'min')}',
    'max': (Map params) =>
        '${getPath(params)} field must be at earlier than ${getParam(params, 'max')}',
  },
};

Map<String, Map<String, Function>> getMessages() {
  return _messages;
}

void setMessages(Map<String, Map<String, Function>> messages) {
  _messages = messages;
}

GetMessage getMessageCb(String type, String t) {
  if (_messages.containsKey(type)) {
    if (_messages[type].containsKey(t)) {
      return _messages[type][t];
    }
  }
  return (Map params) => '';
}

GetMessage getMixedMessage(String t) {
  return getMessageCb('mixed', t);
}

GetMessage getStringMessage(String t) {
  return getMessageCb('string', t);
}

GetMessage getNumberMessage(String t) {
  return getMessageCb('number', t);
}

GetMessage getBoolMessage(String t) {
  return getMessageCb('bool', t);
}

GetMessage getListMessage(String t) {
  return getMessageCb('list', t);
}

GetMessage getDateMessage(String t) {
  return getMessageCb('date', t);
}
