import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/app_helper.dart';
import '../Utils/my_color.dart';
import '../controller/profileViewController.dart';
import '../routes/routes_name.dart';  
import '../widgets/texts/my_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    final controller = Get.put(ProfileViewController());
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Profile",
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.logout).onTap(() {
                AppHelper.helper.setToken = "";
                AppHelper.helper.email = "";
                AppHelper.helper.lastname = "";
                AppHelper.helper.name = "";
                AppHelper.helper.userId = 0;
                Get.offAllNamed(ImmediateRoute);
              }),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.primaries.first),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Obx(
                () => MyText(
                        text:
                            '${controller.userInfo.value.first_name ?? ""} ${controller.userInfo.value.last_name ?? ""}',
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                    .pOnly(top: 10),
              ),
              Obx(
                () => MyText(
                    text: controller.userInfo.value.email ?? "",
                    textStyle: const TextStyle(fontSize: 12)),
              ),
            ],
          ).p12(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: MyColor.grey1, spreadRadius: 1),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Obx(
                      () => MyText(
                              text:
                                  '${controller.userInfo.value.no_of_donations ?? 0}',
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                          .pOnly(top: 10),
                    ),
                    MyText(
                        text: "Donate",
                        textStyle: const TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                            text: "12",
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                        .pOnly(top: 10),
                    MyText(
                        text: "Donate",
                        textStyle: const TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Obx(
                      () => MyText(
                              text:
                                  controller.userInfo.value.blood_group ?? "X",
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                          .pOnly(top: 10),
                    ),
                    MyText(
                        text: "Blood Group",
                        textStyle: const TextStyle(fontSize: 12)),
                  ],
                )
              ],
            ).marginAll(20),
          ).paddingOnly(left: 20, right: 20, top: 10),
          MyText(text: "General", textStyle: const TextStyle(fontSize: 12))
              .pOnly(left: 20, top: 10, bottom: 10),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.profList.length,
            itemBuilder: (context, index) => ListTile(
              tileColor: MyColor.grey1,
              leading: controller.profList[index].icon,
              title: MyText(
                text: controller.profList[index].name ?? "",
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ).marginOnly(top: 10, bottom: 20),
              trailing: const Icon(Icons.notifications_none_outlined),
            ).pOnly(top: 5, bottom: 5).onTap(() {
              switch (index) {
                case 0:
                Get.toNamed(EditProfileRoute);
                case 1:
                  Get.toNamed(ChangePasswordRoute);
                  break;
                default:
              }
            }),
          )
        ],
      ),
    );
  }
}
