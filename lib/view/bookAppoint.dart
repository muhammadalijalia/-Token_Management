import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:blood_donation/controller/bookappointViewController.dart';

import '../widgets/buttons/my_button.dart';

class BookAppoint extends StatelessWidget {
  var hospitalId, doctorId;
  var docName, hospitalName;
  BookAppoint({
    Key? key,
    required this.hospitalId,
    required this.doctorId,
    required this.docName,
    required this.hospitalName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookAppointViewController());
    controller.getBookedToken(doctorId, hospitalId);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: 'Book Token'.text.make(),
        
      ),
      body: Obx(
        () =>   Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  'Your Token No'.text.white.size(18).make(),
                  '${(controller.bookCurrent.value.bookedToken ?? 0) + 1}'
                      .text
                      .white
                      .size(24)
                      .bold
                      .make(),
                  // 'Estimate time 2:45 Hour'.text.white.size(18).make(),
                ],
              ).marginAll(12),
            ).p12(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      '${controller.bookCurrent.value.currentToken}'
                          .text
                          .white
                          .size(22)
                          .make(),
                      'Current Token'.text.white.size(22).make(),
                    ],
                  ).marginAll(12),
                ).p4(),
                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      '${controller.bookCurrent.value.bookedToken}'
                          .text
                          .white
                          .size(22)
                          .make(),
                      'Booked Token'.text.white.size(22).make(),
                    ],
                  ).marginAll(12),
                ).p4(),
              ],
            ).p8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            'Hospital: '.text.size(22).bold.make(),
            '$hospitalName'.text.capitalize.size(18).make(),
            ],),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            'Doctor  : '.text.size(22).bold.make(),
            '$docName'.text.capitalize.size(18).make(),
            
            ],),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              'Date  : '.text.size(22).bold.make(),
            DateFormat('yyyy-MM-dd').format(DateTime.now()).text.size(18).make(),
          ],),
          controller.loading.value
          ? const CircularProgressIndicator().pOnly(top: 40)
          : MyButton(width: 200,onPressed: () { _showConfirmPopup(controller);}, text: 'Confirm Bookinng').pOnly(top: 40),
          ],
        ),
      ),
    );
  }
  void _showConfirmPopup(BookAppointViewController controller) {
    Get.defaultDialog(
      title: 'Confirmation',
      middleText: 'Are you sure you want to perform this action?',
      textConfirm: 'Yes',
      textCancel: 'No',
      confirm: MyButton(
        width: 120,
        onPressed: () {
         controller.createTokenAfterConfirm(doctorId, hospitalId);
          Get.back(result: true);
        },
        text: 'Yes',
      ),
      cancel: MyButton(
        width: 120,
        onPressed: () {
          // Cancel the action when "No" is clicked
          Get.back(result: false);
        },
        text: 'No',
      ),
    );
  }

}