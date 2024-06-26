import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlContent extends StatelessWidget {
  final String htmlData;

  const HtmlContent({super.key, required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlData,
      textStyle: const TextStyle(fontSize: 16.0),
      customStylesBuilder: (element) {
        if (element.localName == 'p') {
          return {'font-size': '16px', 'font-weight': 'bold'};
        }
        if (element.localName == 'ul') {
          return {'font-size': '14px'};
        }
        if (element.localName == 'li') {
          return {'font-size': '12px'};
        }
        return null;
      },
    );
  }
}