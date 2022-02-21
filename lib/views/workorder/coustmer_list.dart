import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/models/get_all_customers_model.dart' as geta;
import 'package:erply_login/providers/customer_provider.dart';
import 'package:erply_login/widgets/custom_listview_tile.dart';
import 'package:erply_login/widgets/custom_text_field.dart';
import 'package:provider/src/provider.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  late List<geta.GetallCustomers> getallcustomers;
  final TextEditingController _textEditingController = TextEditingController();
  bool isDataLoaded = false;
  getdata(BuildContext context) async {
    getallcustomers =
        await context.read<CustomerProvider>().getAllCustomers(context);
    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    getdata(context);
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
                  'Customers',
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
                        labelText: 'Name, Phone, Email',
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
                child: isDataLoaded
                    ? ListView.builder(
                        itemCount: getallcustomers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListviewTile(
                            rowFirstValue:
                                getallcustomers[index].eInvoiceEmail!,
                            headerValue: getallcustomers[index].fullName!,
                            rowSecondValue: getallcustomers[index].mobile!,
                            color: index % 2 == 0
                                ? const Color(0xff202427)
                                : Colors.white.withOpacity(0.025),
                          );
                        })
                    : Center(
                        child: Container(
                        child: CircularProgressIndicator(),
                      )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
