import 'package:blood_donation/controller/findDoctorViewController.dart';
import 'package:blood_donation/model/timeslot_model.dart';
import 'package:blood_donation/view/bookAppoint.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/my_color.dart';
import '../widgets/buttons/my_button.dart';

class HospitalDetailView extends StatelessWidget {
  final int id;
  const HospitalDetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FindDoctorViewController>();
    return Scaffold(
      appBar: AppBar(title: 'Detail'.text.make(),),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        "About Hospital".text.size(18).semiBold.make().pOnly(top: 16),
        '${controller.hospitalData[id].hospital_Detail}'.text.make().pOnly(top: 16),
        'Available Doctors'.text.size(18).semiBold.make().pOnly(top: 16),
        Obx(()=>
           Expanded(
             child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.doctorsDataa.length,
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
                                                        image: const DecorationImage(
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
                                                 ('${controller.doctorsDataa[index].user.first_name} ${controller.doctorsDataa[index].user.last_name}').text.capitalize.size(18).semiBold.make(),
                                                'Contact: ${controller.doctorsDataa[index].user.phone_number}'.text.make(),
                                                'Email: ${controller.doctorsDataa[index].user.email}'.text.make(),
                                                // Row(
                                                //   mainAxisAlignment:
                                                // MainAxisAlignment.spaceBetween,
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
                                        'View Schedule'.text.align(TextAlign.right).make().onTap(() {
                                          controller.getschedules(controller.doctorsDataa[index].id, controller.hospitalData[id].id);
                                                  }),
                                        MyButton(
                                          width: 300,
                                          onPressed: () {
                                            Get.to(()=>BookAppoint(hospitalId: controller.hospitalData[id].id, doctorId: controller.doctorsDataa[index].id, docName:  controller.doctorsDataa[id].user.first_name + ' ' + controller.doctorsDataa[id].user.last_name, hospitalName:  controller.hospitalData[id].user.first_name + ' ' + controller.hospitalData[id].user.last_name));
                                          },
                                          text: "Book Appointment",
                                        ),
                                      ],
                                    ).p16(),
                                  ),
                                ),
           ),
        ),
    ],).p8(),);
  }
}