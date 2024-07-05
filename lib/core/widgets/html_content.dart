import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlContent extends StatelessWidget {
  final String htmlData;

  const HtmlContent({super.key, required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        alignment: Alignment.topLeft,
        fit: BoxFit.contain,
        child: HtmlWidget(
          htmlData,
          textStyle: TextStyle(fontSize: 16.0.sp),
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
            //Add custom styles for table elements
            if (element.localName == 'table') {
              return {
                'border': '1px solid black',
                'border-collapse': 'collapse',
              };
            }
            if (element.localName == 'th' || element.localName == 'td') {
              return {'border': '1px solid black', 'padding': '10px'};
            }
            return null;
          },
        ),
      ),
    );
  }
}
