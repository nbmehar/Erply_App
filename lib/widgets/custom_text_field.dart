import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/utils/styles/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.labelText = '',
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.regularXText(),
      controller: controller,
      decoration: _decoration(),
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
      // textInputAction: TextInputAction.done,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Email address is not valid';
      //   } else if (isEmailValid(value)) {
      //     return null;
      //   } else {
      //     return 'Email address is not valid';
      //   }
      // },
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.darkBlueGrey.withOpacity(0.2),
      suffixIcon: Icon(
        Icons.search,
        size: 24.r,
        color: Colors.white,
      ),
      contentPadding: EdgeInsets.all(12.r),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            BorderSide(color: AppColors.white.withOpacity(0.2), width: 2.0),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            BorderSide(color: AppColors.white.withOpacity(0.2), width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            BorderSide(color: AppColors.white.withOpacity(0.2), width: 2.0),
      ),

      // errorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(5),
      //   borderSide: const BorderSide(color: Colors.red, width: 2.0),
      // ),
      hintText: labelText,
      hintStyle:
          TextStyle(color: AppColors.white.withOpacity(0.2), fontSize: 16.sp),
    );
  }
}
