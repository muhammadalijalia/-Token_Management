import 'dart:collection';

import 'package:blood_donation/Utils/app_helper.dart';
import 'package:blood_donation/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/error.dart';

class ContractDetailViewController extends GetxController {
  
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final contact = TextEditingController();


  final address1 = TextEditingController();
  final address2 = TextEditingController();
  final city = TextEditingController();
  final province = TextEditingController();
  final country = TextEditingController();
  final postalCode = TextEditingController();
  final dateOfBirth = TextEditingController();
  final gender = "Male".obs;
  final userDataValue = UserDataModel.empty().obs;
  var selectedIndex = 0.obs;
  final loading = false.obs;

 
  @override
  void onInit() {
    super.onInit();
     getContactInfo();
  }

  getContactInfo() async {
    NetworkResponse? userData =
          await Api().apiCall("patients/${AppHelper.helper.patientId}", null, null, RequestType.GET);
       userData?.maybeWhen(success: (data) {
        loading.value = false;
        userDataValue.value = UserDataModel.fromMap(data);
       updateData(userDataValue.value);
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

  void updateProfile() async {
    loading.value = true;
      Map<String, Object> requestData = HashMap();
      Map<String, Object> user = HashMap();
      
      user['first_name'] = firstname.text;
      user['last_name'] = lastname.text;
      user['country'] = country.text;
      user['email'] = email.text;
      user['postal_code'] = postalCode.text;
      user['country'] = country.text;
      user['address'] = address1.text;
      user['address_2'] = address2.text;
      user['city'] = city.text;
      user['gender'] = gender.value == 'Male' ? 1 : 2;
      user['dob'] = dateOfBirth.text;
      requestData['user'] = user;
      requestData['blood_group'] = "A+";
      NetworkResponse? userData =
          await Api().apiCall("patients/${AppHelper.helper.patientId}", null, requestData, RequestType.PUT);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        userDataValue.value = UserDataModel.fromMap(data);
        showToast("Profile Updated !!", ErrorType.success);
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

  changeTab(int index) {
    selectedIndex.value = index;
  }
  updateData(UserDataModel dataModel) {
  lastname.text = dataModel.user.last_name;
  email.text = dataModel.user.email;
  firstname.text = dataModel.user.first_name;
  contact.text = dataModel.user.phone_number;
  address1.text = dataModel.user.address;
  address2.text = dataModel.user.address_2;
  city.text = dataModel.user.city;
  country.text = dataModel.user.country;
  postalCode.text = dataModel.user.postal_code;
  }
}
