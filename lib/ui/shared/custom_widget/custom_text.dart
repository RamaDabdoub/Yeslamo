import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customtext extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;

  const Customtext({
    super.key,
    required this.text,
    this.styleType = TextStyleType.body,
    this.textColor = Colors.white,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
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
    TextStyle result = const TextStyle();

    switch (styleType) {
      case TextStyleType.title:
        result = TextStyle(
            fontSize: screenWidth(21),
            fontWeight: fontWeight ?? FontWeight.w800,
            color: textColor);
        break;
      case TextStyleType.subtitle:
        result = TextStyle(
            fontSize: screenWidth(26.2),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.body:
        result = TextStyle(
            fontSize: fontSize ?? screenWidth(29),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.small:
        result = TextStyle(
            fontSize: fontSize ?? screenWidth(34),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.custom:
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
