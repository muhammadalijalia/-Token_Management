import 'package:blood_donation/controller/profileViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/my_color.dart';
import '../widgets/buttons/my_button.dart';
import '../widgets/textfields/my_underline_textfield.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var controller = Get.put(ProfileViewController());
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.lock_open, size: 32, color: MyColor.blue1),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Reset Password".text.size(32).bold.make(),
            "Enter a new Password".text.size(18).make(),
            "Old Password".text.size(18).make().pOnly(top: 10),
            MyUnderlineTextfield(
                textController: controller.oldpassword,
                hintText: "Enter Old Password"),
            "New Password".text.size(18).make().pOnly(top: 10),
            MyUnderlineTextfield(
                textController: controller.newpassword,
                hintText: "Enter New Password"),
            "Confirm Password".text.size(18).make().pOnly(top: 10),
            MyUnderlineTextfield(
                textController: controller.confirmpassword,
                hintText: "Enter Password to Confirm Password"),
            MyButton(
              onPressed: (() {
                controller.changePassword();
              }),
              text: "CHANGE PASSWORD",
              width: width,
            )
          ],
        ).p12());
  }
}
