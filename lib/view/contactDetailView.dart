
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/app_helper.dart';
import '../Utils/my_color.dart';
import '../controller/contactDetailViewController.dart';
import '../widgets/buttons/my_button.dart';
import '../widgets/textfields/date_textfield.dart';
import '../widgets/textfields/my_dropdown_textfield.dart';
import '../widgets/textfields/my_textfield.dart';

class ContactDetailView extends StatelessWidget {
  const ContactDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ContractDetailViewController());
    return Scaffold(
      appBar: AppBar(title: 'Profile Settings'.text.make(),),
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) => SizedBox(
                        width: context.width / 2,
                        child: ElevatedButton(
                          onPressed: () => controller.changeTab(index),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                controller.selectedIndex.value == index
                                    ? MyColor.blue1
                                    : MyColor.white1),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                controller.selectedIndex.value == index
                                    ? MyColor.white1
                                    : MyColor.blue1),
                          ),
                          child:
                              (index == 0 ? "Profile Info" : "Address Detail")
                                  .text
                                  .make(),
                        ).p4(),
                      )),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: MyColor.white1,
                boxShadow: [
                  BoxShadow(
                    color: MyColor.grey2.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: ListView(
                children: [
                  Visibility(
                      visible: controller.selectedIndex.value == 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Contact Details".text.size(18).make().pOnly(top: 10),
                          "Address Line 1".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.address1, hintText: ""),
                          "Address Line 2".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.address2, hintText: ""),
                          "City".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.city, hintText: ""),
                          "State / Province"
                              .text
                              .size(18)
                              .make()
                              .pOnly(top: 10),
                          MyTextField(
                              textController: controller.province, hintText: ""),
                          "Country".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.country, hintText: ""),
                          "Postal Code".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.postalCode, hintText: ""),
                          MyButton(
                            onPressed: ()=> controller.updateProfile(),
                            text: "Done",
                          ),
                        ],
                      )),
                  Visibility(
                      visible: controller.selectedIndex.value == 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Basic Information"
                              .text
                              .size(18)
                              .make()
                              .pOnly(top: 10),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppHelper.helper.image != ""
                                  ? CachedNetworkImage(
                                      imageUrl: AppHelper.helper.image,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator()
                                              .centered(), // Placeholder widget while loading
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error)
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
                          ).centered(),
                          // "Username".text.size(18).make().pOnly(top: 10),
                          // MyTextField(
                          //     textController: controller.username, hintText: ""),
                           "First Name".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.firstname, hintText: ""),
                            "Last Name".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.lastname, hintText: ""),
                          "Email".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.email, hintText: ""),
                          "Phone Number".text.size(18).make().pOnly(top: 10),
                          MyTextField(
                              textController: controller.contact, hintText: ""),
                               "Gender".text.size(18).make().pOnly(top: 10),
                              Obx(()=> DropDownTextfield(hintText: 'Specify your Gender',textController: controller.gender.value)),
                          "Date of Birth".text.size(18).make().pOnly(top: 10),
                          DateTextField(hintText: "Date of Birth", textEditingController: controller.dateOfBirth),
                          
                          MyButton(
                            onPressed: () => controller.changeTab(1),
                            text: "Next",
                          ),
                        ],
                      ))
                ],
              ).p8(),
            ).p12()),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
