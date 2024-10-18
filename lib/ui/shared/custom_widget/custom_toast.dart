import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/message_type.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static showMeassge({
    required String message,
    MessageType messageType = MessageType.info,
  }) {
    String imageName = 'info';
    Color shadowColor = AppColors.navyColor;

    switch (messageType) {
      case MessageType.info:
        imageName = 'info';
        //    shadowColor = AppColors.blueColor;
        break;
      case MessageType.warning:
        imageName = 'warning';
        //  shadowColor = AppColors.redColor;
        break;
      case MessageType.rejected:
        imageName = 'rejected-01';
        //shadowColor = AppColors.redColor;
        break;
      case MessageType.sucssess:
        imageName = 'approved1-01';
        //shadowColor = AppColors.grayColor;
        break;
    }

    BotToast.showCustomText(
        duration: const Duration(seconds: 3),
        toastBuilder: (value) {
          return Container(
            padding: EdgeInsets.all(screenWidth(40)),
            width: screenWidth(3),
            height: screenWidth(5),
            decoration: BoxDecoration(
                //      color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Customtext(
              text: message,
              styleType: TextStyleType.subtitle,
              maxLines: 2,
            ),
          );
        });
  }
}
