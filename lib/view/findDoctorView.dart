import 'package:blood_donation/Utils/my_color.dart';
import 'package:blood_donation/controller/findDoctorViewController.dart';
import 'package:blood_donation/view/hospitaldetailView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes/routes_name.dart';
import '../widgets/buttons/my_border_button.dart';
import '../widgets/buttons/my_button.dart';
import '../widgets/textfields/outlined_textfield.dart';
import 'sideView.dart';

class FindDoctorView extends StatelessWidget {
  const FindDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(FindDoctorViewController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const SideView(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
              color: MyColor.white1,
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: "Find Doctor".text.color(MyColor.white1).make(),
          actions: [
            IconButton(
              color: MyColor.white1,
              icon: const Icon(Icons.notifications),
              onPressed: () => () {},
            ),
            PopupMenuButton<String>(
              iconColor: MyColor.white1,
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: controller.handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  color: MyColor.darkBlue,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      "Find Hospital".text.size(18).semiBold.make(),
                      Expanded(
                        child: Obx(()=>
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.hospitalData.length,
                            itemBuilder: (context, index) => Card(
                              color: MyColor.white1,
                              elevation: 2.0,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: "https://picsum.photos/300/200",
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator()
                                                .centered(), // Placeholder widget while loading
                                        errorWidget: (context, url, error) =>
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/call_pic.png"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                height: 80,
                                                width: 80),
                          
                                        imageBuilder: (context, imageProvider) =>
                                            Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        // Other CachedNetworkImage properties...
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ('${controller.hospitalData[index].user.first_name} ${controller.hospitalData[index].user.last_name}').text.size(18).semiBold.make(),
                                          'Contact: ${controller.hospitalData[index].user.phone_number}'.text.make(),
                                          'Email: ${controller.hospitalData[index].user.email}'.text.make(),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceAround,
                                          //   children: [
                                          //     'Dentist'.text.make(),
                                          //     '9+Exp'.text.make(),
                                          //   ],
                                          // )
                                        ],
                                      ).pOnly(left: 16)
                                    ],
                                  ),
                                  DottedLine(
                                    lineLength: 300,
                                    lineThickness: 1,
                                    dashRadius: 2,
                                  ).py12(),
                                  MyButton( 
                                    onPressed:() {
                                      controller.getHospitalDoctors(controller.hospitalData[index].id);
                                      Get.to(()=>HospitalDetailView(id: index));
                                    },
                                    text: "View",
                                  ),
                                ],
                              ).p16(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).p8(),
                )
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .16,
                  right: 20.0,
                  left: 20.0),
              child: SizedBox(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: MyColor.white1,
                  elevation: 4.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: CircleAvatar(
                                backgroundColor: MyColor.white1,
                                radius: 20,
                                child: const Icon(Icons.location_on),
                              )).pOnly(right: 16),
                          Expanded(
                              child: lineTextfield(
                                  textController: controller.search,
                                  hintText: "Search Hospital")),
                        ],
                      ),
                      MyBorderButton(
                        onPressed: (() {
                          controller.getHospitals();
                          Get.toNamed(AllRoute);
                        }),
                        text: "SEARCH NOW",
                      ),
                    ],
                  ).px16(),
                ),
              ),
            )
          ],
        ));
  }
}
