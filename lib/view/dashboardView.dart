import 'package:blood_donation/Utils/app_helper.dart';
import 'package:blood_donation/controller/dashboardViewController.dart';
import 'package:blood_donation/view/sideView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/my_color.dart';
import '../widgets/texts/my_text.dart';
import 'dashboardDetailView.dart';

class DashbboardView extends StatelessWidget {
  const DashbboardView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    var controller = Get.put(DashboardViewController());
    return Scaffold(
      drawer: const SideView(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading:     AppHelper.helper.image != "" ? CachedNetworkImage(
                                               height: 50,
                width:  50,
                fit: BoxFit.fill,
                                            imageUrl: AppHelper.helper.image,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator()
                                                    .centered(), // Placeholder widget while loading
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Icon(Icons.error)
                                                    .centered(), // Widget to display on error

                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // Other CachedNetworkImage properties...
                                          ) :
                      Image.asset(
                "images/profile.png",
                height: 100,
              ),
              title: MyText(
                text: "Welcome Back!",
                textStyle: const TextStyle(fontSize: 12),
              ),
              subtitle: MyText(
                text: "${AppHelper.helper.name} ${AppHelper.helper.lastname}",
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              trailing: const Icon(Icons.notifications_none_outlined),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        text: "Health Tips",
                        textStyle:
                            TextStyle(fontSize: 16, color: MyColor.blue1)),
                    MyText(
                        text: "",
                        textStyle:
                            TextStyle(fontSize: 12, color: MyColor.blue1)),
                  ],
                ),
                SizedBox(
                  height: height * 1.2,
                  child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.publishData.length,
                        itemBuilder: (context, index) => Container(
                              width: context.width / 1.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: MyColor.grey1, // Set border color
                                    width: 0.2), // Set border width
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        10.0)), // Set rounded corner radius
                                // Make rounded corner of border
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller
                                              .publishData[index].image_url !=
                                          ""
                                      ? CachedNetworkImage(
                                        height: height* 0.3,
                                          imageUrl: controller
                                                  .publishData[index]
                                                  .image_url ??
                                              "",
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator()
                                                  .centered(), // Placeholder widget while loading
                                          errorWidget: (context, url,
                                                  error) =>
                                              const Icon(Icons.error)
                                                  .centered(), // Widget to display on error

                                          imageBuilder:
                                              (context, imageProvider) =>
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
                                      : Image.asset("images/google_add.png"),
                                  MyText(
                                          text: controller
                                                  .publishData[index].category
                                                  ?.toUpperCase() ??
                                              "",
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: MyColor.blue1))
                                      .pOnly(left: 10, right: 10, top: 8),
                                  (controller.publishData[index].title ?? "")
                                      .text
                                      .bold
                                      .maxLines(2)
                                      .make()
                                      .pOnly(left: 10, right: 10, top: 8),
                                
                                     Html(data: controller.publishData[index].content?.split('\n').first ?? ""),
                                ],
                              ),
                            ).p8().onTap(() {
                              Get.to(() => const DashboardDetailView(),
                                  arguments: controller.publishData[index]);
                            })),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        text: "Health Tips",
                        textStyle:
                            TextStyle(fontSize: 16, color:MyColor.blue1)),
                    MyText(
                        text: "",
                        textStyle:
                            TextStyle(fontSize: 12, color: MyColor.blue1)),
                  ],
                ),
                SizedBox(
                  height: height * 1.2,
                  child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.eventsData.length,
                        itemBuilder: (context, index) => Container(
                              width: context.width / 1.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: MyColor.grey1, // Set border color
                                    width: 0.8), // Set border width
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        10.0)), // Set rounded corner radius
                                // Make rounded corner of border
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller
                                              .eventsData[index].image_url !=
                                          ""
                                      ? CachedNetworkImage(
                                        height: height* 0.3,
                                          imageUrl: controller.eventsData[index]
                                                  .image_url ??
                                              "",
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator()
                                                  .centered(), // Placeholder widget while loading
                                          errorWidget: (context, url,
                                                  error) =>
                                              const Icon(Icons.error)
                                                  .centered(), // Widget to display on error

                                          imageBuilder:
                                              (context, imageProvider) =>
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
                                      : Image.asset("images/google_add.png"),
                                  // Image.asset("images/google_add.png"),
                                  MyText(
                                          text: controller
                                                  .eventsData[index].event_name
                                                  ?.toUpperCase() ??
                                              "",
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: MyColor.blue1))
                                      .pOnly(left: 10, right: 10, top: 8),
                                  (controller.eventsData[index].address ?? "")
                                      .text
                                      .bold
                                      .maxLines(2)
                                      .make()
                                      .pOnly(left: 10, right: 10, top: 8),
                                  Html(data: controller.eventsData[index].content?.split('\n').first ?? ""),
                                ],
                              ),
                            ).p8().onTap(() {
                              Get.to(() => const DashboardEventsDetailView(),
                                  arguments: controller.eventsData[index]);
                            })),
                  ),
                ),
              ],
            )
          ],
        ).p12(),
      ),
    );
  }
}
