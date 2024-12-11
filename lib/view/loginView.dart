import 'package:blood_donation/controller/loginViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Utils/my_color.dart';
import '../routes/routes_name.dart';
import '../widgets/buttons/my_button.dart';
import '../widgets/textfields/my_textfield.dart';
import '../widgets/textfields/my_underline_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var controller = Get.put(LoginViewController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person_pin, size: 32, color: MyColor.blue1),
      ),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      "Let's Sign in".text.size(32).bold.make(),
      "Welcome Back, You've been missed!".text.size(18).make(),
      "Email".text.size(18).make().pOnly(top: 10),
      MyTextField(
          textController: controller.email,
          hintText: "Enter your email address"),
      "Password".text.size(18).make().pOnly(top: 10),
      MyUnderlineTextfield(
          textController: controller.password, hintText: "Enter password"),
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
      MyButton(
        onPressed: (() {
          controller.login();
        }),
        text: "SIGN IN",
        width: width,
      ),
      Row(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(ForgetRoute);
            },
            child: 'Forgot Password?'.text.color(MyColor.grey2).make(),
          ),
          const Spacer(),
          "Don't have an account? ".text.color(MyColor.grey2).make(),
          "Sign up".text.color(MyColor.blue1).bold.make().onTap(() {
            Get.toNamed(SignUpRoute);
          })
        ],
      )
              ],
            ).p12(),
    );
  }
}
