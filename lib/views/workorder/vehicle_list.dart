import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/widgets/custom_listview_tile.dart';
import 'package:erply_login/widgets/custom_text_field.dart';

class VehiclesList extends StatefulWidget {
  const VehiclesList({Key? key}) : super(key: key);

  @override
  _VehiclesListState createState() => _VehiclesListState();
}

class _VehiclesListState extends State<VehiclesList> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.darkBackground,
        body: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'Vehicles',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44.h,
                      width: 220.w,
                      child: CustomTextFormField(
                        controller: _textEditingController,
                        labelText: 'License Plate,VIN..',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SizedBox(
                      height: 44.h,
                      width: 44.w,
                      child: ElevatedButton(
                        onPressed: () => {
                          // #TODO add functionality on button click
                          print('add button pressed')
                        },
                        child: Icon(
                          Icons.filter_alt_outlined,
                          size: 24.r,
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            primary: AppColors.white.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SizedBox(
                      height: 44.h,
                      width: 44.w,
                      child: ElevatedButton(
                        onPressed: () {
                          // #TODO add functionality on button click
                          print('add button pressed');
                        },
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 24.r,
                        )),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    addSemanticIndexes: true,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return ListviewTile(
                        headerValue: 'Land Rover',
                        rowFirstValue: 'Discvery IV D6',
                        rowSecondValue: 'GAA668',
                        color: index % 2 == 0
                            ? const Color(0xff202427)
                            : Colors.white.withOpacity(0.025),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
