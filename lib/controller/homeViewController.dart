import 'package:blood_donation/model/publish_post_model.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  final loading = false.obs;
  final publishData = <PublishPostModel>[].obs;
  final selectedIndex = 0.obs;
  @override
  void onInit() {
     super.onInit();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}