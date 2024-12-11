import 'package:get/get.dart';
import '../NetworkLayer/Api.dart';
import '../NetworkLayer/network_response.dart';
import '../Utils/error.dart';
import '../model/appoint_model.dart';

class AppointmentViewController extends GetxController {
  final loading = false.obs;
  final appointment = <Appointment>[].obs;


  
  @override
  void onInit() {
   
    getAppointment();
     super.onInit();
  }

  getAppointment() async {
    NetworkResponse? userData =
          await Api().apiCall("patients-appointment", null, null, RequestType.GET);
      userData?.maybeWhen(success: (data) {
        loading.value = false;
        var res =  AppointModel.fromJson(data);
        if (res.appointment?.isNotEmpty ?? false) {
        appointment.value = res.appointment ?? [];
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
}