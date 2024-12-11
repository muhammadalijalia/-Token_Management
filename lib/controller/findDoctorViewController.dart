import 'package:blood_donation/Utils/my_color.dart';
import 'package:blood_donation/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/app_helper.dart';
import '../Utils/error.dart';
import '../model/doctor_hospital_model.dart';
import '../model/timeslot_model.dart';
import '../routes/routes_name.dart';

class FindDoctorViewController extends GetxController {
  final search = TextEditingController();
  final loading = false.obs;
  final hospitalData = <HospitalModel>[].obs;
  final doctorsDataa = <HospitalModel>[].obs;
  final doctorsData = <HospitalModel>[].obs;
  final timeSlot = DoctorTimeSlot().obs;
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        AppHelper.helper.setToken = "";
        AppHelper.helper.email = "";
        AppHelper.helper.lastname = "";
        AppHelper.helper.name = "";
        AppHelper.helper.userId = 0;
        Get.offAllNamed(ImmediateRoute);
      case 'Settings':
        Get.toNamed(ContactRoute);
    }
  }
  @override
  void onInit() {
    getHospitals();
    super.onInit();
    // getHospitalDoctors(1);
  }

   getHospitals() async {
    loading.value = true;
    var param = <String, dynamic>{};
    if (search.text.isNotEmpty) {
      param['query'] = search.text;
    }
    NetworkResponse? userData =
          await Api().apiCall("hospitals", param, null, RequestType.GET);
      userData?.maybeWhen(successList: (data) {
        loading.value = false;
         hospitalData.value =  data.map((e) => HospitalModel.fromMap(e)).toList();
      }, loading: (message) {
        loading.value = false;
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
  }

    getHospitalDoctors(int hospital) async {
      doctorsDataa.value = [];
    loading.value = true;
    NetworkResponse? userData =
          await Api().apiCall("hospital-specific-doctor/$hospital", null, null, RequestType.GET);
          
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        doctorsDataa.value = [];
        var doctor = Doctors.fromMap(data).doctors;
        if (doctor?.isNotEmpty ?? false) {
          doctorsDataa.value = doctor ?? [];
        }
         
      }, loading: (message) {
        loading.value = false;
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
  }
  //   getschedules(int hospitalId) async {
  //   NetworkResponse? userData =
  //         await Api().apiCall("doctor-hospital-schedule/$hospitalId", null, null, RequestType.GET);
  //      userData?.maybeWhen(success: (data) {
  //       loading.value = false;
  //       timeSlot.value = TimeSlotModel.fromJson(data);
  //       print(data);
  //     }, loading: (message) {
  //       loading.value = false;
  //     }, error: (message) {
  //       loading.value = false;
  //       showToast(message, ErrorType.error);
  //     }, orElse: () {
  //       showToast("Some Issue in Connection", ErrorType.error);
  //     });
  // }
    getschedules(int doctorId, int hospitalId) async {
    NetworkResponse? userData =
          await Api().apiCall("specific-doctor/$doctorId/hospital-schedule/$hospitalId", null, null, RequestType.GET);
       userData?.maybeWhen(success: (data) {
        loading.value = false;
        timeSlot.value = DoctorTimeSlot.fromJson(data);
        _showListPopup(timeSlot.value);
        print(data);
      }, loading: (message) {
        loading.value = false;
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
  }
void _showListPopup(DoctorTimeSlot timeSlotData) {
  Get.dialog(
    AlertDialog(
      title: const Text('Schedule'),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite, // Set width to maximum
        height: 400.0, // Set your desired height
        child: ListView.builder(
          itemCount: timeSlotData.data?.first.doctor?.length ?? 0,
          itemBuilder: (context, index) {
            var item = timeSlotData.data?.first.doctor?[index];
            return ListTile(
              title: '${getWeekDay(item?.weekday ?? '')}'.text.bold.make(),
              trailing: '${formatTimeString(item?.timeSlots?.first.startTime ?? '')}- ${formatTimeString(item?.timeSlots?.first.endTime ?? '')}'.text.color(MyColor.blue1).make()
            );
          },
        ),
      ),
      actions: [
          const Text('Close').onTap(() {
            Get.back();
           }),
      ],
    ),
  );
}
   getWeekDay(String day){
      switch (day) {
        case '0':
          return 'Sunday';
          case '1':
          return 'Monday';
          case '2':
          return 'Tuesday';
          case '3':
          return 'Wednesday';
          case '4':
          return 'Thursday';
          case '5':
          return 'Friday';
          case '6':
          return 'Saturday';
        default:
          break;
      }
  }
  String formatTimeString(String timeSlot) {
    // Parse the input string to DateTime
    DateTime dateTime = DateFormat('HH:mm:ss').parse(timeSlot);

    // Format the DateTime object to a desired format
    String formattedTime = DateFormat('h:mm a').format(dateTime);

    return formattedTime;
  }
}
