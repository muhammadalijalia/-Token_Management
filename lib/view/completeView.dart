import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/my_color.dart';
import '../controller/findDoctorViewController.dart';
import '../widgets/buttons/my_button.dart';
import 'hospitaldetailView.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FindDoctorViewController>();
    return PopScope(
       canPop: true,
         onPopInvoked: (bool didPop) {
                if (didPop) {
                controller.search.text = "";
                controller.getHospitals();
                }
            
              },
      child: Scaffold(
        appBar: AppBar(title: 'All Hospitals'.text.make()),
        body:  Container(
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
                                  const DottedLine(
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
      ).p12(),
                      ),
    );
  }
}