import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/utils/styles/text_styles.dart';
import 'package:erply_login/widgets/app_text_field.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  _buildTextField({String initialText = '', bool isEditable = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
        initialValue: initialText,
        enabled: isEditable,
        style: Styles.regularTextSemiBold(),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide.none),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide.none),
          hintStyle:
              Styles.regularXText(fontColor: AppColors.white.withOpacity(0.4)),
          filled: true,
          fillColor: const Color(0xFF2A2F32),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/icons/edit.svg', width: 10),
          ),
        ),
      ),
    );
  }

  _buildInvoiceButtons(
      {required String text,
      Color textColor = AppColors.white,
      Color backGroundColor = Colors.white}) {
    return Expanded(
      child: SizedBox(
        // height: 54.h,
        child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: backGroundColor == Colors.white
                    ? AppColors.white.withOpacity(0.2)
                    : backGroundColor,
                padding: EdgeInsets.symmetric(
                    vertical: text.contains("\n") ? 10.h : 20.h)),
            onPressed: () {},
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: Styles.regularTextXBold(
                  fontColor: textColor.withOpacity(0.8), size: 16.sp),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          _buildTextField(initialText: 'Oil Change'),
          _buildTextField(initialText: 'Bay One'),
          _buildTextField(initialText: 'Jacob Aquafriend'),
          _buildTextField(initialText: '01/02/2022'),
          SizedBox(
            height: 35.h,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildInvoiceButtons(text: 'Reassign'),
                    SizedBox(width: 10.h),
                    _buildInvoiceButtons(text: 'Move'),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    _buildInvoiceButtons(
                        text: 'Cancel \nAssignment', textColor: Colors.red),
                    SizedBox(width: 10.h),
                    _buildInvoiceButtons(text: 'Print '),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Divider(),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(
                width: 100.w,
                height: 140.h,
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: Styles.regularText(
                            size: 40.sp,
                            fontColor: AppColors.white.withOpacity(0.6)),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Discount',
                        style: TextStyle(
                            color: AppColors.white.withOpacity(
                              0.6,
                            ),
                            fontWeight: FontWeight.w300,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Tax',
                        style: TextStyle(
                            color: AppColors.white.withOpacity(
                              0.6,
                            ),
                            fontWeight: FontWeight.w300,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Net',
                        style: TextStyle(
                            color: AppColors.white.withOpacity(
                              0.6,
                            ),
                            fontWeight: FontWeight.w300,
                            fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 200.w,
                height: 140.h,
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$3230.00',
                        style: Styles.regularTextSemiBold(
                            size: 40.sp, fontColor: AppColors.white),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '\$ 300.00',
                        style: Styles.regularTextSemiBold(
                            fontColor: AppColors.white.withOpacity(
                              0.6,
                            ),
                            size: 18.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '\$ 300.00',
                        style: Styles.regularTextSemiBold(
                            fontColor: AppColors.white.withOpacity(
                              0.6,
                            ),
                            size: 18.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '\$ 300.00',
                        style: Styles.regularTextSemiBold(
                            fontColor: AppColors.white.withOpacity(
                              0.6,
                            ),
                            size: 18.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              _buildInvoiceButtons(
                  text: 'SEND \nQUOTE',
                  textColor: AppColors.darkBackground,
                  backGroundColor: const Color(0xFFF7C545)),
              SizedBox(width: 10.w),
              _buildInvoiceButtons(
                  text: 'Invoice \nCustomer',
                  textColor: AppColors.darkBackground,
                  backGroundColor: const Color(0xFF5ABB7C)),
            ],
          )
        ],
      ),
    );
  }
}
