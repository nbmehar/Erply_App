import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/utils/styles/text_styles.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      this.hint,
      this.inputAction,
      this.inputType,
      this.error,
      this.onChanged,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textAlign,
      this.controller,
      this.isSuffix,
      this.isPass,
      this.inputFormatters,
      this.isVisible,
      this.maxLen,
      this.textCapitalization,
      this.icon,
      this.enabled})
      : super(key: key);

  Function(String)? onChanged;
  String? hint;
  TextInputAction? inputAction;
  TextInputType? inputType;
  String? error;
  bool? obscureText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextAlign? textAlign;
  TextEditingController? controller;
  bool? isSuffix = false;
  bool? isPass = false;
  bool? isVisible = false;
  int? maxLen;
  TextCapitalization? textCapitalization;
  Widget? icon;
  bool? enabled;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          textInputAction: inputAction,
          style: Styles.regularXText(),
          onChanged: onChanged,
          maxLength: maxLen,
          inputFormatters: inputFormatters,
          obscureText: obscureText!,
          enabled: enabled ?? true,
          textCapitalization: textCapitalization != null
              ? textCapitalization!
              : TextCapitalization.none,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                borderSide: BorderSide(
                    color: AppColors.white.withOpacity(0.5), width: 0.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                borderSide: BorderSide(
                    color: AppColors.white.withOpacity(0.5), width: 0.5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                borderSide: BorderSide(
                    color: AppColors.white.withOpacity(0.5), width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                borderSide: BorderSide(
                    color: AppColors.white.withOpacity(0.5), width: 0.5)),
            errorText: error,
            errorMaxLines: 3,
            // errorBorder: BorderStyles.errorBorder,
            // errorStyle: Styles.normalTextStyle(context,
            //     fontSize: DeviceSize.width(context) / 40, color: Colors.red),
            hintStyle: Styles.regularXText(
                fontColor: AppColors.white.withOpacity(0.4)),
            filled: true,
            hintText: hint,
            fillColor: Colors.transparent,
            suffixIcon: icon,
          ),
        ),
        // Container(
        //   height: 1.5,
        //   color: green,
        //   margin: EdgeInsets.only(left: 1, right: 1),
        // )
      ],
    );
  }
}
