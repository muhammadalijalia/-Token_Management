import 'package:blood_donation/Utils/app_helper.dart';
import 'package:blood_donation/Utils/my_color.dart';
import 'package:blood_donation/routes/routes_name.dart';
import 'package:blood_donation/widgets/buttons/my_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class SideView extends StatelessWidget {
  const SideView({super.key});

  Widget build(BuildContext context) {
    final menuListTitle = [
      'Appointments',
      'Profile Setting',
      'Change Passowrd',
      'Share',
      'Submit Review',
      'About Us'
    ];
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color:  MyColor.darkBlue,),
                  child: Row(children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: AppHelper.helper.image != ""
                            ? CachedNetworkImage(
                                imageUrl: AppHelper.helper.image,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator()
                                        .centered(), // Placeholder widget while loading
                                errorWidget: (context, url, error) => const Icon(
                                        Icons.error)
                                    .centered(), // Widget to display on error

                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Other CachedNetworkImage properties...
                              )
                            : Image.asset(
                                "images/profile.png",
                                height: 100,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "${AppHelper.helper.name} ${AppHelper.helper.lastname}"
                            .text
                            .color(MyColor.white1)
                            .bold
                            .maxFontSize(22)
                            .minFontSize(12)
                            .make(),
                        AppHelper.helper.email.text
                            .color(MyColor.white1)
                            .size(15)
                            .make()
                      ],
                    ).px8()
                  ]),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemCount: menuListTitle.length,
                    itemBuilder: (context, index) {
                      return menuListTitle[index]
                          .text
                          .size(context.isTablet ? 22 : 15)
                          .make()
                          .pOnly(top: 30, bottom: 5, left: 30, right: 30)
                          .onTap(
                            () => menuOnTap(index),
                          );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          color: MyColor.grey1,
                          thickness: 0.8,
                        )).pOnly(top: 10),
                const Divider(
                  color: Colors.white,
                  thickness: 0.8,
                ).pOnly(left: 80, right: 80),
                MyButton(onPressed: () => menuOnTap(6), text: 'Logout')
                    .pOnly(right: context.width / 2.5, left: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }

  menuOnTap(int index) {
    switch (index) {
      case 0:
        Get.back();
        Get.toNamed(AppointRoute);
      case 1:
        Get.back();
        Get.toNamed(ContactRoute);
      case 2:
        Get.back();
        Get.toNamed(ChangePasswordRoute);
      case 3:
        Get.back();
        Share.share(
          subject: 'My Hospital',
          'Blood Donation App for FREE now at\n\n'
          'https://play.google.com/store/apps/details?id=com.dawateislami.hajiabdulhabib\n\n'
          'https://itunes.apple.com/pk/app/maulana-abdul-habib/id1452913592?mt=8',
        );
        break;
      case 4:
        reviewApp();
      case 5:
        Get.back();
        Get.toNamed(AboutRoute);
      case 6:
        AppHelper.helper.setToken = "";
        AppHelper.helper.email = "";
        AppHelper.helper.lastname = "";
        AppHelper.helper.name = "";
        AppHelper.helper.userId = 0;
        Get.offAllNamed(ImmediateRoute);
        break;
      default:
    }
  }

  reviewApp() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      Future.delayed(const Duration(milliseconds: 5), () {
        // if(Platform.isAndroid) {
        inAppReview.openStoreListing(
            appStoreId: '1452913592', microsoftStoreId: '...');
        // }
        // else{
        //   inAppReview.requestReview();
        // }
      });
    }
  }
}
