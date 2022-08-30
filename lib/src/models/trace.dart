import 'package:instabug_flutter/src/modules/apm.dart';

class Trace {
  String id;
  String name = '';
  Map<String, dynamic> attributes;
  Trace(this.id, this.name, {Map<String, dynamic>? listOfAttributes})
      : attributes = listOfAttributes ?? <String, dynamic>{};

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['attributes'] = attributes;
    return map;
  }

  void setAttribute(String key, String value) {
    APM.setExecutionTraceAttribute(id, key, value);
    attributes[key] = value;
  }

  void end() {
    APM.endExecutionTrace(id);
  }
}