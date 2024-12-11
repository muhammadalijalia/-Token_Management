import 'dart:collection';

import 'package:blood_donation/Utils/extensions/String+Extension.dart';
import 'package:blood_donation/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/error.dart';
import '../routes/routes_name.dart';

class SignUpViewController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final gender = "Male".obs;
  final email = TextEditingController();
  final phone = TextEditingController();
  final dateOfBirth = TextEditingController();
  final uniName = TextEditingController();
  final seatNo = TextEditingController();
  final password = TextEditingController();
  final loading = false.obs;

  final isSelected = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void signUp() async {
    loading.value = true;
    String? emailError = email.text.validateEmail();
    String? passwordError = password.text.validatePassword();
    if (firstName.text == "") {
      loading.value = false;
      showToast("Name should not be Empty", ErrorType.error);
      return;
    }
    if (lastName.text == "") {
      loading.value = false;
      showToast("LastName should not be Empty", ErrorType.error);
      return;
    }
    // if (gender.value == "") {
    //   loading.value = false;
    //   showToast("Please Specify the Gennder", ErrorType.error);
    //   return;
    // }
    if (phone.text == "") {
      loading.value = false;
      showToast("Phone number is must", ErrorType.error);
      return;
    }
    // if (dateOfBirth.text == "") {
    //   loading.value = false;
    //   showToast("Please Enter your Birth Date", ErrorType.error);
    //   return;
    // }
    // if (uniName.text == "") {
    //   loading.value = false;
    //   showToast("Please Enter your Education Innstitute", ErrorType.error);
    //   return;
    // }
    // if (seatNo.text == "") {
    //   loading.value = false;
    //   showToast("Seat No is must", ErrorType.error);
    //   return;
    // }
    if (emailError != null) {
      loading.value = false;
      showToast(emailError, ErrorType.error);
      return;
    }
    if (passwordError != null) {
      loading.value = false;
      showToast(passwordError, ErrorType.error);
      return;
    }
    if (emailError == null && passwordError == null) {
      Map<String, Object> requestData = HashMap();

      requestData['first_name'] = firstName.text;
      requestData['last_name'] = lastName.text;
      requestData['phone_number'] = phone.text;
      requestData['email'] = email.text;
      requestData['password'] = password.text;
      // requestData['dob'] = dateOfBirth.text;
      // requestData['gender'] = "1";
      // requestData['university_name'] = "1";
      // requestData['seat_no'] = seatNo.text;
      requestData['role'] = "5";
      NetworkResponse? userData =
          await Api().apiCall("sign-up", null, requestData, RequestType.POST);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        var user = SignUpModel.fromMap(data);
        showToast("Welcome to Donate !", ErrorType.success);
        Get.offAndToNamed(LoginRoute);
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
  }

  void onChange(bool value) {
    isSelected.value = !isSelected.value;
  }
}
