import 'package:html/parser.dart';

String parseHtml(String htmlString) {
  final document = parse(htmlString);

  return document.body?.text ?? '';
}