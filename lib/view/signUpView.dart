import 'package:blood_donation/Utils/my_color.dart';
import 'package:blood_donation/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/signUpViewController.dart';
import '../widgets/buttons/my_border_button.dart';
import '../widgets/textfields/my_textfield.dart';
import '../widgets/textfields/my_underline_textfield.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var controller = Get.put(SignUpViewController());
    return Scaffold(
      appBar: AppBar(
       leading: Icon(Icons.person_add_outlined, size: 32, color: MyColor.blue1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             "Getting Started".text.size(32).bold.make(),
      "Create an account to continue!".text.size(18).make(),
    
            "Name".text.size(18).make().pOnly(top: 10),
            MyTextField(hintText: "Enter First Name",textController: controller.firstName),
            MyTextField(hintText: "Enter Last Name",textController: controller.lastName),
            // Obx(()=> DropDownTextfield(hintText: 'Specify your Gender',textController: controller.gender.value)),
            "Email".text.size(18).make().pOnly(top: 10),
            MyTextField(hintText: "Enter your email address",textController: controller.email),
            "Phone".text.size(18).make().pOnly(top: 10),
            MyTextField(hintText: "Enter your phone number",textController: controller.phone),
            // DateTextField(hintText: "Date of Birth", textEditingController: controller.dateOfBirth),
            // MyTextField(hintText: "Enter your Unversity Name",textController: controller.password),
            // MyTextField(hintText: "Enter your Seat No",textController: controller.seatNo),
            "Password".text.size(18).make().pOnly(top: 10),
            MyUnderlineTextfield(hintText: "Enter password",textController: controller.password),
               Row(
        children: [
          Transform.scale(
              scale: 0.6,
              child: Obx(() => Switch.adaptive(
                  value: controller.isSelected.value,
                  onChanged: controller.onChange))),
          'Remember Me'.text.color(MyColor.grey2).make()
        ],
      ),
            MyBorderButton(
              onPressed: (() {
               controller.signUp();
              }),
              text: "CREATE ACCOUNT",
              width: width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Already have an account? ".text.color(MyColor.grey2).make(),
          "Sign In".text.color(MyColor.blue1).bold.make().onTap(() {
            Get.toNamed(LoginRoute);
          }).p8()
            ],)
          ],
        ).p12()
      ),
    );
  }
}
