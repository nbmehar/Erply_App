import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/constants/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/models/calender_event.dart';
import 'package:erply_login/models/work_order_model.dart';
import 'package:erply_login/providers/schedule_provider.dart';
import 'package:erply_login/providers/work_order_provider.dart';
import 'package:erply_login/widgets/loading_widget.dart';
import 'package:erply_login/widgets/separator.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<String> daysList = ["11", "12", "13", "14", "15", "16", "18"];

  final List<String> monthsList = ["Apr", "May", "June"];

  final List<String> timeList = [
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00",
    "24:00",
  ];

  List<CalenderEvent> currentEventList = [];
  int currentEventIdx = 0;
  bool isEventBuilderStart = false;
  bool isFirstBlock = false;
  bool neverBuildNow = false;

  @override
  Widget build(BuildContext context) {
    initValues();
    currentEventList = context.read<ScheduleProvider>().events;

    return FutureBuilder(
        future: context.read<WorkOrderProvider>().getWorkOrders(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else if (snapshot.hasData) {
            final _workOrders = snapshot.data as List<WorkOrderModel>;
            return Scaffold(
              backgroundColor: AppColors.darkBlueGrey,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOptionsHeader(),
                    SizedBox(
                      height: 30.h,
                    ),
                    _buildMonthSelectionHeader(),
                    SizedBox(
                      height: 15.h,
                    ),
                    _buildDaysSelectionHeader(context),
                    SizedBox(
                      height: 15.h,
                    ),
                    _buildDivider(),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildQuantityRow(),
                    _buildCalenderWidget(context)
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        });
  }

  Expanded _buildCalenderWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: ListView(
        children: timeList
            .asMap()
            .map((idx, day) {
              if (currentEventIdx >= currentEventList.length) {
                isEventBuilderStart = false;
                isFirstBlock = false;
                neverBuildNow = true;
              }

              if (!neverBuildNow) {
                if (currentEventIdx < currentEventList.length &&
                    idx == currentEventList[currentEventIdx].endIdx) {
                  isEventBuilderStart = false;
                  currentEventIdx++;
                }

                if (currentEventIdx < currentEventList.length &&
                    idx == currentEventList[currentEventIdx].startIdx) {
                  isEventBuilderStart = true;
                  isFirstBlock = true;
                }

                if (currentEventIdx < currentEventList.length &&
                    idx != currentEventList[currentEventIdx].startIdx) {
                  isFirstBlock = false;
                }
              }

              return MapEntry(
                  idx,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timeList[idx],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textLightGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            !isEventBuilderStart || isFirstBlock
                                ? Container(
                                    child: const SeparatorVertical(
                                      color: AppColors.shadeDarkAlpha,
                                    ),
                                  )
                                : SizedBox(),
                            Row(
                              children: [
                                Container(
                                  child: const SeparatorHorizontal(
                                    color: AppColors.shadeDarkAlpha,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.06,
                                ),
                                isEventBuilderStart
                                    ? Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            padding:
                                                EdgeInsets.fromLTRB(7, 0, 0, 0),
                                            width: size.width * 0.015,
                                            color: currentEventList[
                                                    currentEventIdx]
                                                .color,
                                          ),
                                          Container(
                                            height: 70,
                                            width: size.width * 0.58,
                                            color: AppColors.eventbgColor,
                                            child: isFirstBlock
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Cadillac Escalade ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Erply Ladna",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "FN278YZ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Erply Ladna",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20.h,
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Xtra",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Erply Ladna",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Velvet",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Erply Ladna",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ),
                                        ],
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
            })
            .values
            .toList(),
      ),
    );
  }

  Row _buildQuantityRow() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.shadeDarkAlpha,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SvgPicture.asset(
            AppImages.greaterIcon,
            fit: BoxFit.none,
            color: AppColors.lightGrey,
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.shadeDarkAlpha,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SvgPicture.asset(
            AppImages.smallerIcon,
            fit: BoxFit.none,
            color: AppColors.lightGrey,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(
          "Bay One",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Row _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: const BoxDecoration(color: AppColors.shadeDarkAlpha),
          ),
        ),
      ],
    );
  }

  SizedBox _buildDaysSelectionHeader(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysList
              .asMap()
              .map((i, day) => MapEntry(i, _buildDayWidget(day, i)))
              .values
              .toList()),
    );
  }

  Widget _buildDayWidget(String day, int i) {
    return Consumer<ScheduleProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: () {
          provider.switchDayToIdx(i);
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.darkBlueGrey,
              border: provider.selectedDayIdx == i
                  ? Border.all(color: AppColors.primaryBlue)
                  : null),
          child: Center(
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textLightGreyColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
    });
  }

  Row _buildMonthSelectionHeader() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.shadeDarkAlpha,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SvgPicture.asset(
            AppImages.greaterIcon,
            fit: BoxFit.none,
            color: AppColors.lightGrey,
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.shadeDarkAlpha,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SvgPicture.asset(
            AppImages.smallerIcon,
            fit: BoxFit.none,
            color: AppColors.lightGrey,
          ),
        ),
        const Expanded(
          child: SizedBox(
            width: 20,
          ),
        ),
        Row(
            children: monthsList
                .asMap()
                .map((i, month) => MapEntry(
                    i,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: _buildMonthWidget(month, i),
                    )))
                .values
                .toList()),
      ],
    );
  }

  Widget _buildMonthWidget(String month, int i) {
    return Consumer<ScheduleProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: () {
          provider.switchMonthToIdx(i);
        },
        child: Container(
          width: 70,
          height: 44,
          decoration: BoxDecoration(
              color: AppColors.shadeDarkAlpha,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: provider.selectedMonthIdx == i
                  ? Border.all(color: AppColors.primaryBlue)
                  : null),
          child: Center(
            child: Text(
              month,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textLightGreyColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    });
  }

  Column _buildOptionsHeader() {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Friday 14",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "th",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Expanded(
                child: SizedBox(
              height: 1,
            )),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.shadeDarkAlpha,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset(
                AppImages.unionIcon,
                fit: BoxFit.none,
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.shadeDarkAlpha,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset(
                AppImages.filterIcon,
                fit: BoxFit.none,
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset(
                AppImages.addIcon,
                fit: BoxFit.none,
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void initValues() {
    currentEventIdx = 0;
    isEventBuilderStart = false;
    isFirstBlock = false;
    neverBuildNow = false;
  }
}
