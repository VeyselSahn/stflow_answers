import 'dart:convert';

import 'package:xml2json/xml2json.dart';

void main(List<String> args) {
  var xmlExample = '''
<?xml version="1.0" encoding="utf-8"?>
<document id="doc1">
  <line id="1">
    <data id="D1" value="20" />
eating
    <data id="D2" value="40" />
  </line>
  <line id="2">
    <data id="D1" value="90" />
drinking
    <data id="D2" value="340" />
  </line>
</document>
''';
  final converter = Xml2Json();
  // firstly convert xml to json
  converter.parse(xmlExample);
  var res = converter.toGData();
  // make model for using easier
  var model = Model.fromJson(jsonDecode(res));
  // call with id
  var _wishModel = model.document?.line?.singleWhere((element) => element.id == '2');
  // use result
  print(_wishModel?.id);
}

// make model for using easier

class Model {
  Document? document;

  Model({this.document});

  Model.fromJson(Map<String, dynamic> json) {
    document = json['document'] != null ? Document.fromJson(json['document']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (document != null) {
      data['document'] = document!.toJson();
    }
    return data;
  }
}

class Document {
  String? id;
  List<Line>? line;

  Document({this.id, this.line});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['line'] != null) {
      line = <Line>[];
      json['line'].forEach((v) {
        line!.add(Line.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (line != null) {
      data['line'] = line!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Line {
  String? id;
  List<Data>? data;
  String? t;

  Line({this.id, this.data, this.t});

  Line.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    t = json['$t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['$t'] = t;
    return data;
  }
}

class Data {
  String? id;
  String? value;

  Data({this.id, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}
