import 'package:blood_donation/model/publish_post_model.dart';
import 'package:get/get.dart';

import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/error.dart';
import '../model/publish_event_model.dart';

class DashboardViewController extends GetxController {
  final loading = false.obs;
  final publishData = <PublishPostModel>[].obs;
  // final postData = <PublishPostModel>[].obs;
  final eventsData = <PublishEvent>[].obs;


  
  @override
  void onInit() {
   
    getAllPublishPost();
    // getAllPost();
    getAllPublishEvent();
     super.onInit();
  }

  getAllPublishPost() async {
    NetworkResponse? userData =
          await Api().apiCall("publish_post", null, null, RequestType.GET);
      userData?.maybeWhen(successList: (data) {
        loading.value = false;
        publishData.value =  data.map((e) => PublishPostModel.fromMap(e)).toList();
       publishData.forEach((element) {print(element);});
      }, loading: (message) {
        loading.value = false;
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
  }
  //   getAllPost() async {
  //   NetworkResponse? userData =
  //         await Api().apiCall("post", null, null, RequestType.GET);
  //     userData?.maybeWhen(successList: (data) {
  //       loading.value = false;
  //       postData.value =  data.map((e) => PublishPostModel.fromMap(e)).toList();
  //      postData.forEach((element) {print(element);});
  //     }, loading: (message) {
  //       loading.value = false;
  //     }, error: (message) {
  //       loading.value = false;
  //       showToast(message, ErrorType.error);
  //     }, orElse: () {
  //       showToast("Some Issue in Connection", ErrorType.error);
  //     });
  // }
   getAllPublishEvent() async {
    NetworkResponse? userData =
          await Api().apiCall("publish_event", null, null, RequestType.GET);
      userData?.maybeWhen(successList: (data) {
        loading.value = false;
        eventsData.value =  data.map((e) => PublishEvent.fromMap(e)).toList();
       
      }, loading: (message) {
        loading.value = false;
      }, error: (message) {
        loading.value = false;
        showToast(message, ErrorType.error);
      }, orElse: () {
        showToast("Some Issue in Connection", ErrorType.error);
      });
  }
}