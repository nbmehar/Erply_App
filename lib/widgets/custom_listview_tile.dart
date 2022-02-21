import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';

class ListviewTile extends StatelessWidget {
  ListviewTile(
      {Key? key,
      required this.headerValue,
      required this.rowFirstValue,
      required this.rowSecondValue,
      required this.color})
      : super(key: key);
  String rowFirstValue, headerValue, rowSecondValue;
  Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 60.h,
        width: 375.h,
        decoration: BoxDecoration(
          color: color,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.white.withOpacity(0.2),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Text(
                headerValue,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(rowFirstValue,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text(rowSecondValue,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListviewTileForWorkorder extends StatelessWidget {
  ListviewTileForWorkorder(
      {Key? key,
      required this.r1e1,
      required this.r1e2,
      required this.r2e1,
      required this.r2e2,
      required this.r3e1,
      required this.r3e2,
      required this.r4e1,
      required this.progressIndicatorColor,
      required this.progressIndicatorValue})
      : super(key: key);
  String r1e1, r1e2, r2e1, r2e2, r3e1, r3e2, r4e1;
  Color progressIndicatorColor;
  double progressIndicatorValue;

  // r == row and e == element
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: 10.0.w, left: 10.0.w, top: 5.h, bottom: 5.h),
      child: Container(
        color: Colors.white.withOpacity(0.05),
        height: 137.h,
        width: 355.h,
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r1e1,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(r1e2, style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  Text(r2e1, style: TextStyle(color: Colors.white)),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(r2e2, style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(r3e1, style: TextStyle(color: Colors.white)),
                  Text(r3e2, style: TextStyle(color: Colors.white))
                ],
              ),
              Container(
                height: 5.h,
                width: 355.w,
                color: Colors.white,
                child: LinearProgressIndicator(
                    value: progressIndicatorValue,
                    backgroundColor: Colors.grey,
                    color: progressIndicatorColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(r4e1, style: TextStyle(color: Colors.white)),
                  Icon(Icons.ac_unit)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridviewForWorkorder extends StatelessWidget {
  GridviewForWorkorder(
      {Key? key,
      required this.color,
      required this.rowFirstValue,
      required this.rowSecondValue,
      required this.progressIndicatorColor,
      required this.progressIndicatorValue})
      : super(key: key);
  Color color, progressIndicatorColor;
  double progressIndicatorValue;
  String rowFirstValue, rowSecondValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 60.h,
        width: 375.h,
        decoration: BoxDecoration(
          color: color,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.white.withOpacity(0.2),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 20.h, bottom: 15.h),
              child: Text(rowFirstValue,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  )),
            ),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              height: 22.h,
              width: 90.w,
              child: Container(
                color: Colors.transparent,
                child: LinearProgressIndicator(
                    value: progressIndicatorValue,
                    backgroundColor: Colors.transparent,
                    color: progressIndicatorColor),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(rowSecondValue,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
