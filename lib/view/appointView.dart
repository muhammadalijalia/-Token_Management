import 'package:blood_donation/Utils/extensions/String+Extension.dart';
import 'package:blood_donation/Utils/my_color.dart';
import 'package:blood_donation/controller/appointmentViewController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/buttons/my_button.dart';

class AppointView extends StatelessWidget {
  const AppointView({super.key});

  @override
  Widget build(BuildContext context) {
     var controller = Get.put(AppointmentViewController());
    return Scaffold(
      appBar: AppBar(title: "Appointments".text.make(),),
      body: Obx(()=>
         ListView.builder(
            itemCount: controller.appointment?.length ?? 0,
            itemBuilder: (context, index) => Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Date ${controller.appointment?[index].date}'.text.bold.make(),
                          (controller.appointment?[index].status ?? "").text.make(),
                        ],
                      ),
                      Container(
                        height: 0.5,
                        color: MyColor.black1,
                      ).p2(),
                      Row(
                        children: [
                          // CachedNetworkImage(
                          //   imageUrl: "https://picsum.photos/300/200",
                          //   placeholder: (context, url) =>
                          //       const CircularProgressIndicator()
                          //           .centered(), // Placeholder widget while loading
                          //   errorWidget: (context, url, error) => Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(30),
                          //         image: DecorationImage(
                          //           image: AssetImage("images/call_pic.png"),
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //       height: 60,
                          //       width: 60),
        
                          //   imageBuilder: (context, imageProvider) => Container(
                          //     height: 60,
                          //     width: 60,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(30),
                          //       image: DecorationImage(
                          //         image: imageProvider,
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //   ),
                          //   // Other CachedNetworkImage properties...
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Hospital: ${controller.appointment[index].hospital}'.text.capitalize.size(16).semiBold.make(),
                              'Doctor: ${controller.appointment[index].doctor}'.text.capitalize.size(16).semiBold.make(),
                              
                               'Token No: ${controller.appointment[index].tokenNo}'.text.capitalize.size(16).semiBold.make(),
                              // "34\$".text.make(),
                            ],
                          ).pOnly(left: 12)
                        ],
                      ).py12(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     MyButton(
                      //       onPressed: () {},
                      //       text: controller.appointment?[index].status?.toUpperCase() ?? "",
                      //       width: 120,
                      //     ).p4(),
                      //     MyButton(
                      //       onPressed: () {},
                      //       text: "View",
                      //       width: 80,
                      //     ).p4(),
                      //     MyButton(
                      //       onPressed: () {},
                      //       text: "Print",
                      //       width: 80,
                      //     ).p4()
                      //   ],
                      // )
                    ],
                  ).p8(),
                ).p12()),
      ),
    );
  }
}
