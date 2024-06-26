import 'package:html/parser.dart' show parse;

String? extractHtmlBody(String htmlString) {
  var document = parse(htmlString);
  return document.body?.text;
}

