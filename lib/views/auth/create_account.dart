import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/constants/app_images.dart';
import 'package:erply_login/providers/create_account_provider.dart';
import 'package:erply_login/views/auth/login_screen.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.darkBackground,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 50.h),
                child: Container(
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkBlueGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Create account",
                          style: LoginStyles.headingStyle,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        const CreateAccTextFields(),
                        SizedBox(
                          height: 30.h,
                        ),
                        const UploadLogo(),
                        SizedBox(
                          height: 40.h,
                        ),
                        const PolicyAgreement(),
                        SizedBox(
                          height: 40.h,
                        ),
                        SimpleButton(
                          title: 'Create account',
                          bgColor: AppColors.disabledButton,
                          onTap: () {},
                          textStyle: LoginStyles.selectedBtnText,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SimpleButton(
                          title: 'Login',
                          bgColor: AppColors.primaryBlue,
                          onTap: () => context
                              .read<CreateAccountProvider>()
                              .onTapLogin(context),
                          textStyle: LoginStyles.selectedBtnText
                              .copyWith(color: AppColors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class UploadLogo extends StatelessWidget {
  const UploadLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        strokeWidth: 1,
        dashPattern: const [4, 4],
        radius: const Radius.circular(5),
        color: AppColors.borderColor,
        padding: EdgeInsets.zero,
        child: Container(
          height: 120.h,
          width: 150.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Upload your logo",
                style: LoginStyles.baseStyle.copyWith(fontSize: 14.sp),
              ),
              SvgPicture.asset(
                AppImages.vehicleIcon,
                height: 50.h,
                width: 50.w,
              )
            ],
          ),
          decoration: BoxDecoration(
              color: AppColors.uploadLogoBg,
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}

class PolicyAgreement extends StatelessWidget {
  const PolicyAgreement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
              side: const BorderSide(color: AppColors.borderColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              value: context.watch<CreateAccountProvider>().isUserAgreeToPolicy,
              tristate: false,
              onChanged: (val) {
                context.read<CreateAccountProvider>().agreeToPolicy = val!;
              }),
        ),
        SizedBox(
          width: 10.h,
        ),
        Expanded(
          child: RichText(
              maxLines: 2,
              text: TextSpan(children: [
                TextSpan(
                    text: "I agree to the",
                    style: LoginStyles.forgetPassText
                        .copyWith(color: AppColors.white.withOpacity(.8))),
                TextSpan(
                    text: " Terms of Service ",
                    style: LoginStyles.forgetPassText),
                TextSpan(
                    text: "and",
                    style: LoginStyles.forgetPassText
                        .copyWith(color: AppColors.white.withOpacity(.8))),
                TextSpan(
                    text: " Privacy Policy", style: LoginStyles.forgetPassText),
              ])),
        )
      ],
    );
  }
}

class CreateAccTextFields extends StatelessWidget {
  const CreateAccTextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          scrollPadding: LoginStyles.scrollPadding,
          style: LoginStyles.textFieldHintText.copyWith(color: AppColors.white),
          decoration:
              LoginStyles.textFieldDecoration.copyWith(labelText: "First Name"),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          scrollPadding: LoginStyles.scrollPadding,
          style: LoginStyles.textFieldHintText.copyWith(color: AppColors.white),
          decoration:
              LoginStyles.textFieldDecoration.copyWith(labelText: "Last Name"),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          scrollPadding: LoginStyles.scrollPadding,
          style: LoginStyles.textFieldHintText.copyWith(color: AppColors.white),
          decoration:
              LoginStyles.textFieldDecoration.copyWith(labelText: "Email"),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          scrollPadding: LoginStyles.scrollPadding,
          style: LoginStyles.textFieldHintText.copyWith(color: AppColors.white),
          decoration:
              LoginStyles.textFieldDecoration.copyWith(labelText: "Password"),
        ),
      ],
    );
  }
}
