import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:erply_login/constants/app_colors.dart';

import 'package:erply_login/providers/login_provider.dart';

import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors.darkBackground,
          body: Consumer<LoginProvider>(builder: (context, prov, _) {
            if (prov.isSigning) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Center(
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
                            "Login with",
                            style: LoginStyles.headingStyle,
                          ),
                          const LoginTypeSelection(),
                          SizedBox(height: 30.h),
                          const LoginTextFields(),
                          ClickableText(
                            text: "Forgot Password?",
                            onTap: () {},
                          ),
                          LoginButton(context),
                          SizedBox(
                            height: 20.h,
                          ),
                          // SimpleButton(
                          //   title: 'Create account',
                          //   bgColor: AppColors.primaryBlue,
                          //   onTap: () {
                          //     // context
                          //     //   .read<LoginProvider>()
                          //     //   .onTapCreateAccount(context);
                          //     //Changed For Now
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => DemoScreen()),
                          //     );
                          //   },
                          //   textStyle: LoginStyles.selectedBtnText
                          //       .copyWith(color: AppColors.white),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          })),
    );
  }
}

class LoginButton extends StatelessWidget {
  BuildContext oldContext;
  LoginButton(this.oldContext);

  @override
  Widget build(BuildContext context) {
    return
        // context.watch<LoginProvider>().isSigning
        //     ? const Center(
        //         child: Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: SizedBox(
        //           height: 30,
        //           width: 30,
        //           child: CircularProgressIndicator(
        //             color: AppColors.white,
        //           ),
        //         ),
        //       ))
        // :
        SimpleButton(
      title: 'Login',
      bgColor: AppColors.white,
      onTap: () => context.read<LoginProvider>().login(oldContext),
      textStyle: LoginStyles.selectedBtnText,
    );
  }
}

class SimpleButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final TextStyle textStyle;
  final VoidCallback onTap;

  const SimpleButton(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.textStyle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: double.infinity,
        child: Center(
          child: Text(title, style: textStyle),
        ),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ClickableText({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Text(
        text,
        style: LoginStyles.forgetPassText,
      ),
    );
  }
}

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
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
          keyboardType: TextInputType.number,
          controller: context.read<LoginProvider>().clientCodeC,
          decoration: LoginStyles.textFieldDecoration
              .copyWith(labelText: "Client Code"),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          scrollPadding: LoginStyles.scrollPadding,
          style: LoginStyles.textFieldHintText.copyWith(color: AppColors.white),
          keyboardType: TextInputType.text,
          controller: context.read<LoginProvider>().usernameC,
          decoration:
              LoginStyles.textFieldDecoration.copyWith(labelText: "Username"),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          scrollPadding: LoginStyles.scrollPadding,
          style: LoginStyles.textFieldHintText.copyWith(color: AppColors.white),
          keyboardType: TextInputType.visiblePassword,
          controller: context.read<LoginProvider>().passwordC,
          decoration:
              LoginStyles.textFieldDecoration.copyWith(labelText: "Password"),
        ),
      ],
    );
  }
}

class LoginTypeSelection extends StatelessWidget {
  const LoginTypeSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 44.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AppImages.userIcon,
                //   height: 20.h,
                //   width: 20.w,
                //   color: AppColors.blackOP8,
                // ),
                Icon(Icons.person),

                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "User Name",
                  style: LoginStyles.selectedBtnText,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
          )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Container(
            height: 44.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AppImages.keyIcon,
                //   height: 20.h,
                //   width: 20.w,
                //   color: AppColors.lightGrey,
                // ),
                Icon(Icons.key),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "SSO",
                  style: LoginStyles.unSelectedBtnText,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.darkBackground,
                borderRadius: BorderRadius.circular(5)),
          ))
        ],
      ),
    );
  }
}

class LoginStyles {
  static const TextStyle baseStyle = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontFamily: "ErplyLadna");
  static const EdgeInsets scrollPadding =
      EdgeInsets.only(bottom: 200, top: 200);

  /// TEXT STYLES
  static TextStyle headingStyle = baseStyle.copyWith(
      fontSize: 25.sp, fontWeight: FontWeight.bold, letterSpacing: 0.24);
  static TextStyle selectedBtnText = baseStyle.copyWith(
      fontSize: 14.sp, color: AppColors.blackOP8, fontWeight: FontWeight.w200);
  static TextStyle unSelectedBtnText = baseStyle.copyWith(
      fontSize: 14.sp, color: AppColors.lightGrey, fontWeight: FontWeight.w200);
  static TextStyle textFieldHintText = baseStyle.copyWith(
      fontSize: 16.sp,
      color: AppColors.borderColor,
      fontWeight: FontWeight.w100);
  static TextStyle forgetPassText = baseStyle.copyWith(
      fontSize: 14.sp,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.w200);
  // TEXT_FIELD DECORATIONS
  static InputDecoration textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      labelText: "lable text",
      labelStyle: textFieldHintText,
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.all(Radius.circular(0))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0))));
}
