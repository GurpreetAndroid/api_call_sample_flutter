import 'package:flutter/material.dart';

import 'marque.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final double wordSpacing;
  //final  VoidCallback onClick;
  final bool isMarquee;
  final bool isExpand;
  final int flexVal;
  final bool isTextCenterAlign;
  final bool isTextUnderline;
  final  double paddingValue;
  final int maxLines;
  const MyTextWidget({super.key,
    required this.text,
    this.size = 12.0,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.wordSpacing = 0.0,
    this.isMarquee = false,
    this.isExpand = false,
    this.flexVal = 0,
    this.isTextCenterAlign= false,
    this.isTextUnderline= false,
    this.paddingValue=0.0,
    this.maxLines=1,
    //this.onClick= super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: isExpand == true
        ? textWidgetExpanded(flexVal, text, size, fontWeight, color, wordSpacing, isMarquee, isTextCenterAlign, isTextUnderline, paddingValue, maxLines)
        : Container(child: isMarquee == true
          ? textWidgetMarquee(text, size, fontWeight, color, wordSpacing, isTextCenterAlign, isTextUnderline, paddingValue, maxLines)
          : textWidget(text, size, fontWeight, color, wordSpacing, isTextCenterAlign, isTextUnderline, paddingValue, maxLines),
        )
    );
  }

  textWidgetExpanded(int flexVal, String text, double size, FontWeight fontWeight, Color color, double wordSpacing, bool isMarquee, bool isTextCenterAlign, bool isTextUnderline, double paddingValue, int maxLines) {
    return Expanded(
      flex: flexVal,
      child: isMarquee == true
          ? textWidgetMarquee(text, size, fontWeight, color, wordSpacing, isTextCenterAlign, isTextUnderline, paddingValue, maxLines)
          : textWidget(text, size, fontWeight, color, wordSpacing, isTextCenterAlign, isTextUnderline, paddingValue, maxLines),
    );
  }

  textWidgetMarquee(String text, double size, FontWeight fontWeight, Color color, double wordSpacing, bool isTextCenterAlign, bool isTextUnderline, double paddingValue, int maxLines) {
    return MarqueeWidget(
      direction: Axis.horizontal,
      child: textWidget(text, size, fontWeight, color, wordSpacing, isTextCenterAlign, isTextUnderline, paddingValue, maxLines ),
    );
  }

  textWidget(String text, double size, FontWeight fontWeight, Color color, double wordSpacing, bool isTextCenterAlign, bool isTextUnderline, double paddingValue, int maxLines) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: Text(text, textAlign: isTextCenterAlign ? TextAlign.center : TextAlign.left, maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color, wordSpacing: wordSpacing,
            decoration: isTextUnderline ? TextDecoration.underline: TextDecoration.none,
        ),
      ),
    );
  }
}