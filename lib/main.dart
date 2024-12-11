import 'package:blood_donation/Utils/app_helper.dart';
import 'package:blood_donation/controller/findDoctorViewController.dart';
import 'package:blood_donation/controller/homeViewController.dart';
import 'package:blood_donation/controller/immediatorViewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Utils/constant.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor:Colors.white),
      //   useMaterial3: true,
      // ),
      initialRoute: AppHelper.helper.getToken != "" ? '/findDoc' : '/',
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(
            () => AppHelper.helper.getToken != ""
                ? FindDoctorViewController()
                : ImmediatorViewController(),
            fenix: true);
      }),
      getPages: appRoutes,
    );
  }
}
