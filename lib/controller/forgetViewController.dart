import 'dart:collection';
import 'package:blood_donation/NetworkLayer/Api.dart';
import 'package:blood_donation/Utils/error.dart';
import 'package:blood_donation/Utils/extensions/String+Extension.dart';
import 'package:blood_donation/model/forget_model.dart';
import 'package:blood_donation/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../NetworkLayer/network_response.dart';

class ForgetViewController extends GetxController {
  final email = TextEditingController();
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void forgetPassword() async {
    loading.value = true;
    String? emailError = email.text.validateEmail();
    if (emailError != null) {
      loading.value = false;
       showToast(emailError, ErrorType.error);
       return;
    }
    if (emailError == null) {
      Map<String, Object> requestData = HashMap();
      requestData['email'] = email.text;
      NetworkResponse? userData =
          await Api().apiCall("users/forgot-password", null, requestData, RequestType.POST);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        var res = ForgetModel.fromMap(data);
       
        Get.offAndToNamed(LoginRoute);
         showToast(res.message ?? "", ErrorType.success);
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
}
