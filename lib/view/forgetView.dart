import 'package:blood_donation/controller/forgetViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Utils/my_color.dart';
import '../widgets/buttons/my_button.dart';
import '../widgets/textfields/my_textfield.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgetViewController());
    return Scaffold(
        appBar: AppBar(
          leading:
              Icon(Icons.lock_person_sharp, size: 32, color: MyColor.blue1),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Forget Password".text.size(32).bold.make(),
            "We need your registration email account to send you password reset code!"
                .text
                .size(18)
                .make(),
            "Email".text.size(18).make().pOnly(top: 10),
            MyTextField(
                hintText: "Enter your email address",
                textController: controller.email),
            MyButton(
              onPressed: (() {
                controller.forgetPassword();
              }),
              text: "SEND",
            )
          ],
        ).p12());
  }
}
