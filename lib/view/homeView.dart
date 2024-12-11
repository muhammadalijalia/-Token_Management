import 'package:blood_donation/Utils/my_color.dart';
import 'package:blood_donation/controller/homeViewController.dart';
import 'package:blood_donation/view/profileView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboardView.dart';
import 'sideView.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DashbboardView(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeViewController());
    return Container(
      color: MyColor.white1,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          drawer: const SideView(),
          body: Obx(
              () => _widgetOptions.elementAt(controller.selectedIndex.value)),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.donut_small_rounded),
                  label: 'Track Camps',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: MyColor.red1,
              onTap: controller.onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
