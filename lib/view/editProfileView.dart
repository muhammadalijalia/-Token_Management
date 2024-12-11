import 'package:blood_donation/controller/forgetViewController.dart';
import 'package:blood_donation/controller/profileViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/my_color.dart';
import '../controller/signUpViewController.dart';
import '../routes/routes_name.dart';
import '../widgets/buttons/my_border_button.dart';
import '../widgets/buttons/my_button.dart';
import '../widgets/textfields/date_textfield.dart';
import '../widgets/textfields/my_dropdown_textfield.dart';
import '../widgets/textfields/my_textfield.dart';
import '../widgets/textfields/my_underline_textfield.dart';
import '../widgets/texts/my_text.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var controller = Get.find<ProfileViewController>();
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Edit Profile",
          textStyle: TextStyle(
              fontSize: 17.0,
              color: MyColor.black1,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.bloodtype,
                  color: Colors.red,
                ).paddingOnly(right: 10),
                MyText(
                  text: "Blood Donation",
                  textStyle: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Edit",
                  textStyle: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ).pOnly(bottom: 10),
                MyTextField(
                    hintText: "Change Blood Group",
                    textController: controller.firstName),
                MyTextField(
                    hintText: "Change City",
                    textController: controller.lastName),
                MyTextField(
                    hintText: "Enter Address",
                    textController: controller.email),
                DateTextField(
                    hintText: "Change Date of Birth",
                    textEditingController: controller.dateOfBirth),
                MyTextField(
                    hintText: "Change Donation Count",
                    textController: controller.seatNo),
                MyBorderButton(
                  onPressed: controller.editProfile,
                  text: "SUBMIT",
                  width: width,
                )
              ],
            ).p12(),
          ],
        ).p12(),
      ),
    );
  }
}
