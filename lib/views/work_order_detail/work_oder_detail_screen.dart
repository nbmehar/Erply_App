import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/utils/styles/text_styles.dart';
import 'package:erply_login/views/work_order_detail/page_views/invoice_view.dart';
import 'package:erply_login/views/work_order_detail/page_views/work_view.dart';

class WorkOrderDerailScreen extends StatefulWidget {
  const WorkOrderDerailScreen({Key? key}) : super(key: key);

  @override
  _WorkOrderDerailScreenState createState() => _WorkOrderDerailScreenState();
}

class _WorkOrderDerailScreenState extends State<WorkOrderDerailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkBlueGrey,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 312.w,
                    child: TabBar(
                      labelStyle: Styles.regularTextMedium(
                          size: 50.sp, fontColor: AppColors.white),
                      unselectedLabelColor: AppColors.white.withOpacity(0.4),
                      controller: _tabController,
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: AppColors.blueColor, width: 2),
                        insets: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 00.0),
                      ),
                      onTap: (val) {
                        _controller.jumpToPage(val);
                      },
                      tabs: const [
                        FittedBox(child: Text('Work')),
                        FittedBox(child: Text('Invoice')),
                        FittedBox(child: Text('Customer')),
                      ],
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                    child: Icon(
                      Icons.close,
                      color: AppColors.white.withOpacity(0.4),
                    ),
                  )
                ],
              ),
              Container(
                height: 737.h,
                padding: EdgeInsets.only(top: 2.h),
                child: PageView(
                  controller: _controller,
                  onPageChanged: (val) {
                    _tabController.animateTo(val);
                  },
                  children: [
                    WorkView(),
                    InvoiceView(),
                    Container(
                      color: AppColors.darkBlueGrey,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
