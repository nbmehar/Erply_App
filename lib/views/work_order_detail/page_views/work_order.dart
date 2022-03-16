import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/models/work_order_model.dart';
import 'package:erply_login/providers/work_order_provider.dart';
import 'package:erply_login/widgets/custom_listview_tile.dart';
import 'package:erply_login/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class WorkOrder extends StatefulWidget {
  const WorkOrder({Key? key}) : super(key: key);

  @override
  _WorkOrderState createState() => _WorkOrderState();
}

class _WorkOrderState extends State<WorkOrder> {
  bool isListView = true;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    final _randomColor = Color.fromARGB(_random.nextInt(256),
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkBlueGrey,
      body: FutureBuilder(
        future: context.read<WorkOrderProvider>().getWorkOrders(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else if (snapshot.hasData) {
            final _workOrders = snapshot.data as List<WorkOrderModel>;
            return Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jamaica L',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        )),
                    const Expanded(
                        flex: 1,
                        child: Icon(Icons.filter_alt_outlined,
                            color: Colors.white)),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            isListView ? Icons.list : Icons.grid_view,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            // setState(() {
                            // isListView = !isListView;
                            // });
                          },
                        )),
                  ],
                ),
                isListView
                    ? Container()
                    : SizedBox(
                        height: 36.h,
                        width: 375.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            const Text(
                              'LP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 72.w,
                            ),
                            const Text(
                              'Make',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 74.w,
                            ),
                            const Text(
                              'Work',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _workOrders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return isListView
                            ? ListviewTileForWorkorder(
                                r1e1: 'Ford Range Super 2021',
                                r1e2: 'FN284YZ',
                                r2e1: 'Long BED (>6.5)',
                                r2e2: 'Rail: Under',
                                r3e1: 'BAY 3',
                                r3e2: '6580 ',
                                r4e1: 'DRAFT',
                                progressIndicatorColor: Color.fromARGB(
                                    _random.nextInt(256),
                                    _random.nextInt(256),
                                    _random.nextInt(256),
                                    _random.nextInt(256)),
                                progressIndicatorValue: _random.nextDouble())
                            : GridviewForWorkorder(
                                color: index % 2 == 0
                                    ? AppColors.darkBackground
                                        .withOpacity(0.025)
                                    : Colors.white.withOpacity(0.025),
                                rowFirstValue:
                                    '${_workOrders[index].workorderNo}',
                                rowSecondValue: 'Body Armour',
                                progressIndicatorColor: Color.fromARGB(
                                    _random.nextInt(256),
                                    _random.nextInt(256),
                                    _random.nextInt(256),
                                    _random.nextInt(256)),
                                progressIndicatorValue: _random.nextDouble(),
                              );
                      }),
                )
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
