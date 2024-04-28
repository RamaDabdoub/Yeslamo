
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  
   CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      required this.obscureText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
        // onChanged: (value) {
        //   FormState.val
        //   formKey.currentState!.validate()
        // },
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon:suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayColor, width: 2),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: screenWidth(30) ,
          ),
          
          fillColor: AppColors.grayColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth(20) , horizontal: screenWidth(20) ),
          errorStyle:
              TextStyle(color: AppColors.lightblueColor.withOpacity(0.8), fontSize: screenWidth(26) ),
        ));
  }
}
