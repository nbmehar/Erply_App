import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/constants/app_images.dart';
import 'package:erply_login/models/botttom_menu_item.dart';
import 'package:erply_login/views/auth/login_screen.dart';
import 'package:erply_login/views/schedule/schedule_screen.dart';
import 'package:erply_login/views/settings/settings_screen.dart';
import 'package:erply_login/views/work_order_detail/page_views/work_order.dart';
import 'package:erply_login/views/work_order_detail/work_oder_detail_screen.dart';
import 'package:erply_login/views/workorder/coustmer_list.dart';
import 'package:erply_login/views/workorder/vehicle_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        pageController: pageController,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          SettingsScreen(),
          WorkOrder(),
          // WorkOrderDerailScreen(),
          ScheduleScreen(),
          CustomerList(),
          VehiclesList(),
        ],
      ),
    );
  }
}

class BottomMenu extends StatefulWidget {
  final PageController pageController;
  const BottomMenu({Key? key, required this.pageController}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedPage = 0;
  final List<BottomMenuItem> bottomMenuIcons = [
    BottomMenuItem(name: "Settings", icon: AppImages.settings),
    BottomMenuItem(name: "Work Orders", icon: AppImages.workorder),
    BottomMenuItem(name: "Schedule", icon: AppImages.schedule),
    BottomMenuItem(name: "Customers", icon: AppImages.customer),
    BottomMenuItem(name: "Vehicles", icon: AppImages.vehicle2),
  ];

  void _onPageChange(int index) {
    widget.pageController.jumpToPage(index);
    selectedPage = index;
    setState(() {});
  }

  bool checkIsMenuSelected(int index, int selectedIndex) =>
      index == selectedIndex ? true : false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bottomMenuBg,
      height: 75.h,
      width: double.infinity,
      child: ListView.separated(
        itemCount: bottomMenuIcons.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            _onPageChange(i);
          },
          child: SizedBox(
            height: 75.h,
            width: MediaQuery.of(context).size.width / bottomMenuIcons.length,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      bottomMenuIcons[i].icon,
                      width: 22.w,
                      color: checkIsMenuSelected(i, selectedPage)
                          ? AppColors.white
                          : AppColors.white.withOpacity(.5),
                    ),
                    Text(
                      bottomMenuIcons[i].name,
                      style: LoginStyles.baseStyle.copyWith(
                        fontSize: 10.sp,
                        color: checkIsMenuSelected(i, selectedPage)
                            ? AppColors.white
                            : AppColors.white.withOpacity(.5),
                      ),
                    )
                  ]),
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Container(
              color: AppColors.borderColor,
              width: 1,
              height: 22.w,
            ),
          ),
        ),
      ),
    );
  }
}
