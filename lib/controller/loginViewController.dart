import 'dart:collection';
import 'package:blood_donation/NetworkLayer/Api.dart';
import 'package:blood_donation/Utils/app_helper.dart';
import 'package:blood_donation/Utils/error.dart';
import 'package:blood_donation/Utils/extensions/String+Extension.dart';
import 'package:blood_donation/model/user_data.dart';
import 'package:blood_donation/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../NetworkLayer/network_response.dart';

class LoginViewController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final isSelected = false.obs;
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    loading.value = true;
    String? emailError = email.text.validateEmail();
    String? passwordError = password.text.validatePassword();
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
      requestData['email'] = email.text;
      requestData['password'] = password.text;
      NetworkResponse? userData =
          await Api().apiCall("sign-in", null, requestData, RequestType.POST);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        var user = UserData.fromMap(data);
        AppHelper.helper.setToken = user.access_token ?? "";
        AppHelper.helper.userId = user.id ?? 0;
        AppHelper.helper.email = user.email ?? "";
        AppHelper.helper.name = user.first_name  ?? "";
        AppHelper.helper.lastname = user.last_name  ?? "";
        AppHelper.helper.patientId = user.dhp_id  ?? 0;
        
        
        showToast("Welcome to Donate !", ErrorType.success);
        Get.offAllNamed(FindDoctorRoute);
        print(user);
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
