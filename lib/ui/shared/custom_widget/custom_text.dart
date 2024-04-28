import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Customtext extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
 final int?maxLines;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;

  const Customtext({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.textColor = Colors.white,
    this.fontWeight,
    this.fontSize, this.maxLines,
     this.overflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    
    return Text(
      text,
       style: getStyle(Get.size),
      // textAlign: TextAlign.justify,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
            fontSize:screenWidth(21),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
            fontSize:screenWidth(26.2),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.BODY:
        result = TextStyle(
            fontSize:fontSize?? screenWidth(29),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
            fontSize: fontSize??screenWidth(34),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
            fontSize: screenWidth(28),
            fontWeight: FontWeight.normal,
            color: textColor);
        break;
    }

    return result;
  }
}
