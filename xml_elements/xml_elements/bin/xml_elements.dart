import 'dart:convert';

import 'package:xml2json/xml2json.dart';

void main(List<String> arguments) {
  var xmlexample = '''<bookshelf>
  <book id="1">
    <title lang="en">Growing a Language</title>
    <chapter number="1">What's a Language?</chapter>
    <chapter number="2">Basics</chapter>
    <chapter number="3">Examples</chapter>
    <chapter number="4">Exam</chapter>
  </book>
  <book id="2">
    <title lang="en">Learning XML</title>
    <chapter number="1">What's XML?</chapter>
    <chapter number="2">Theory</chapter>
  </book>
  <book id="3">
    <title lang="en">Personal Computer</title>
    <chapter number="1">What's a PC?</chapter>
    <chapter number="2">Hardware</chapter>
    <chapter number="3">Operating system</chapter>
  </book>
</bookshelf>''';
  final converter = Xml2Json();
  converter.parse(xmlexample);
  var res = converter.toGData();
  var _decode = jsonDecode(res);
  print(_decode['bookshelf']['book'][1]);
}
