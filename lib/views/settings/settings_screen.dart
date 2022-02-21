import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/constants/app_icons.dart';
import 'package:erply_login/providers/settings_provider.dart';
import 'package:erply_login/services/login_services.dart';
import 'package:erply_login/utils/styles/text_styles.dart';
import 'package:erply_login/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _buildSettingsTile(
      {required String text,
      String subtext = '',
      required String leading,
      bool isLink = false,
      required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.white.withOpacity(0.1), width: 1))),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 25.w),
        leading: SvgPicture.asset(leading),
        onTap: onTap,
        subtitle: subtext.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  subtext,
                  style: Styles.regularXText(
                      fontColor: AppColors.white.withOpacity(0.4)),
                ),
              )
            : null,
        title: Text(
          text,
          style: Styles.regularXTextSemiBold(
              fontColor: AppColors.white.withOpacity(0.8)),
        ),
        trailing: Icon(
          isLink ? Icons.open_in_new : Icons.arrow_forward_ios,
          color: AppColors.white.withOpacity(0.7),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSettingsTile(
                  text: 'Back Office',
                  subtext: 'Log into back office',
                  leading: AppIcons.erplyIcon,
                  isLink: true,
                  onTap: () {
                    context.read<SettingsProvider>().onTapBackOffice();
                  }),
              _buildSettingsTile(
                  text: 'Erply Wiki',
                  subtext: 'Erply manual & help articles',
                  leading: AppIcons.erplyWikiIcon,
                  isLink: true,
                  onTap: () {
                    context.read<SettingsProvider>().onTapErplyWiki();
                  }),
              _buildSettingsTile(
                  text: 'Contact Us',
                  leading: AppIcons.deviceIcon,
                  onTap: () {
                    context.read<SettingsProvider>().onTapContactUs();
                  }),
              _buildSettingsTile(
                  text: 'Theme',
                  subtext: 'Dark Theme Enabled',
                  leading: AppIcons.themeIcon,
                  onTap: () {}),
              _buildSettingsTile(
                  text: 'Settings',
                  subtext:
                      'Configuration, printing, payment, access rights, locations',
                  leading: AppIcons.settingsIcon,
                  onTap: () {}),
              _buildSettingsTile(
                  text: 'Sign out',
                  subtext: 'Sign out of Erply',
                  leading: AppIcons.signOutIcon,
                  onTap: () {
                    context.read<SettingsProvider>().onTapSignOut(context);
                  }),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
                child: Text(
                  'v. 0.0.1',
                  style: Styles.regularXText(
                      fontColor: AppColors.white.withOpacity(0.8)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
