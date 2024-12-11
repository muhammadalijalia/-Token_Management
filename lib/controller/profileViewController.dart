import 'dart:collection';

import 'package:blood_donation/model/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/app_helper.dart';
import '../Utils/error.dart';

class ProfileViewController extends GetxController {
  final loading = false.obs;
  final userInfo = UserProfileModel().obs;
  final profList = [
    ListData("Edit Profile", const Icon(Icons.person)),
    ListData(
        "Change Password ", const Icon(Icons.published_with_changes_outlined))
  ];
  final oldpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final dateOfBirth = TextEditingController();
  final seatNo = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  getUser() async {
    var userId = AppHelper.helper.userId;
    if (userId != 0) {
      NetworkResponse? userData = await Api()
          .apiCall("users/$userId/profile", null, null, RequestType.GET);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        userInfo.value = UserProfileModel.fromMap(data);
        AppHelper.helper.image = userInfo.value.image_url ?? "";
        AppHelper.helper.userId = userInfo.value.id ?? 0;
        AppHelper.helper.email = userInfo.value.email ?? "";
        AppHelper.helper.name = userInfo.value.first_name ?? "";
        AppHelper.helper.lastname = userInfo.value.last_name ?? "";
      }, loading: (message) {
        loading.value = false;
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
    } else {
      print("User nnot found");
    }
  }

  void changePassword() async {
    loading.value = true;
    if (oldpassword.text == "") {
      loading.value = false;
      showToast('Old Password should not be Empty', ErrorType.error);
      return;
    }
    if (newpassword.text != confirmpassword.text ||
        newpassword.text == "" ||
        confirmpassword.text == "") {
      loading.value = false;
      showToast('Confirm Password not Match', ErrorType.error);
      return;
    } else {
      Map<String, Object> requestData = HashMap();
      requestData['password'] = oldpassword.text;
      requestData['new_password'] = newpassword.text;
      NetworkResponse? userData = await Api().apiCall(
          "users/${AppHelper.helper.userId}/change-password",
          null,
          requestData,
          RequestType.PUT);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        showToast("password update successfully", ErrorType.success);
        Get.back();
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

  void editProfile() async {
    
      Map<String, Object> requestData = HashMap();
    requestData['dob'] = dateOfBirth.text != "" ? dateOfBirth.text : userInfo.value.dob ?? ""; 
    requestData['city'] = lastName.text != "" ? lastName.text : userInfo.value.city ?? "";
    requestData['address'] = email.text != "" ? email.text : userInfo.value.address ?? "";
    requestData['blood_group'] = firstName.text != "" ? firstName.text : userInfo.value.blood_group ?? "";
    requestData['no_of_donations'] = seatNo.text != "" ? seatNo.text : userInfo.value.no_of_donations ?? "";
      NetworkResponse? userData = await Api().apiCall(
          "users/${AppHelper.helper.userId}/profile",
          null,
          requestData,
          RequestType.PATCH);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
         userInfo.value = UserProfileModel.fromMap(data);
        AppHelper.helper.image = userInfo.value.image_url ?? "";
        AppHelper.helper.userId = userInfo.value.id ?? 0;
        AppHelper.helper.email = userInfo.value.email ?? "";
        AppHelper.helper.name = userInfo.value.first_name ?? "";
        AppHelper.helper.lastname = userInfo.value.last_name ?? "";
        Get.back();
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

class ListData {
  final String? name;
  final Icon icon;

  ListData(this.name, this.icon);
}
