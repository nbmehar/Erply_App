import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/utils/styles/text_styles.dart';
import 'package:erply_login/widgets/app_text_field.dart';

class WorkView extends StatefulWidget {
  const WorkView({Key? key}) : super(key: key);

  @override
  _WorkViewState createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 8.w, top: 30.w, right: 8.w, bottom: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 86.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#91923",
                        style: Styles.regularTextSemiBold(
                            fontColor: Colors.white, size: 25.sp),
                      ),
                      Text(
                        'FN278YZ',
                        style: Styles.regularTextSemiBold(
                            fontColor: Colors.white, size: 22.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: 185.w,
                    child: Text(
                      'Ford Ranger Super XL Wide',
                      style: Styles.regularTextSemiBold(
                          fontColor: Colors.white, size: 18.sp),
                    )),
                SizedBox(
                    width: 20.w,
                    child: SvgPicture.asset('assets/icons/edit.svg')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 85,
                    child: AppTextField(
                      hint: 'Services',
                      isSuffix: true,
                      suffixIcon: Icons.search,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 15,
                  child: SizedBox(
                    width: ScreenUtil().orientation == Orientation.portrait
                        ? 44.w
                        : 50.h,
                    height: ScreenUtil().orientation == Orientation.portrait
                        ? 44.w
                        : 50.h,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.blueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: List.generate(3, (index) => const ServiceItem()),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}

class ServiceItem extends StatefulWidget {
  const ServiceItem({Key? key}) : super(key: key);

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  _buildAddField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 280.w,
            child: AppTextField(
              hint: 'Add Work',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width:
                ScreenUtil().orientation == Orientation.portrait ? 44.w : 50.h,
            height:
                ScreenUtil().orientation == Orientation.portrait ? 44.w : 50.h,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  color: AppColors.darkBlueGrey,
                )),
          )
        ],
      ),
    );
  }

  _buildItemDetail() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColors.white.withOpacity(0.1)))),
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oil Change',
                style: Styles.regularXTextSemiBold(
                    fontColor: AppColors.white, size: 16.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '312',
                      style: Styles.slimText(fontColor: AppColors.white),
                    ),
                    Text(
                      '1.5h',
                      style: Styles.slimText(fontColor: AppColors.white),
                    ),
                    Text(
                      '10 %',
                      style: Styles.slimText(fontColor: AppColors.white),
                    ),
                    Text(
                      '\$ 225',
                      style: Styles.slimText(fontColor: AppColors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.white.withOpacity(0.7),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                'Oil Change “ Super Lux” with fillup',
                style:
                    Styles.regularText(fontColor: AppColors.white, size: 20.sp),
              ),
            ),
            _buildItemDetail(),
            _buildItemDetail(),
            _buildAddField(),
            _buildItemDetail(),
            _buildItemDetail(),
            _buildAddField(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.redColor,
                            primary: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20)),
                        onPressed: () {},
                        child: Text('DELETE SERVICE',
                            style: TextStyle(fontSize: 16.sp))),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        const SizedBox(
                          width: 15,
                        ),
                        Text('Show on Quote  and Invoice',
                            style: Styles.regularText()),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
