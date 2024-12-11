import 'dart:collection';

import 'package:blood_donation/Utils/app_helper.dart';
import 'package:blood_donation/model/timeslot_model.dart';
import 'package:blood_donation/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/error.dart';
import '../widgets/buttons/my_button.dart';

class BookAppointViewController extends GetxController {

final loading = false.obs;

final bookCurrent = BookedCurrentModel().obs;
final bookedConfirm = BookedConfirm().obs;

  @override
  void onInit() {
    
    super.onInit();
  }
  // getschedules(int hospitalId) async {
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
  getBookedToken(int docId,int hospitalId) async {
     loading.value = true;
    NetworkResponse? userData =
          await Api().apiCall("get-booked-token/$docId/$hospitalId", null, null, RequestType.GET);
       userData?.maybeWhen(success: (data) {
        loading.value = false;
        bookCurrent.value = BookedCurrentModel.fromJson(data);
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
  createTokenAfterConfirm(int docId,int hospitalId) async {
  loading.value = true;
      Map<String, Object> requestData = HashMap();
      requestData['patient'] = AppHelper.helper.patientId;
      requestData['doctor'] = docId;
      requestData['hospital'] = hospitalId;
      requestData['token_no'] = (bookCurrent.value.bookedToken ?? 0) + 1;
      requestData['appointment_time'] =  DateFormat('yyyy-MM-dd').format(DateTime.now());
      NetworkResponse? userData =
          await Api().apiCall("appointment", null, requestData, RequestType.POST);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        var res = BookedConfirm.fromMap(data);
        bookedConfirm.value = res;
        _showThankYouPopup(res.tokenNo ?? '');
      }, loading: (message) {
        loading.value = false;
        print("load -  $message");
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
  }

    void _showThankYouPopup(String token) {
    Get.defaultDialog(
      title: 'Thank You',
      middleText: 'Your Token No\n$token\nPlease provide your name and contact number at the hospital reception to receive your token receipt.',
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      confirm: MyButton(
        width: 120,
        onPressed: () {
          // Cancel the action when "No" is clicked
          Get.offAllNamed(FindDoctorRoute);
        },
        text: 'OK',
      ),
    );
  }
}