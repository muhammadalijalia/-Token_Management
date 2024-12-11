import 'package:blood_donation/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Utils/my_color.dart';
import '../controller/immediatorViewController.dart';
import '../widgets/buttons/my_border_button.dart';
import '../widgets/buttons/my_button.dart';

class ImmediatorView extends GetView<ImmediatorViewController> {
  const ImmediatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset("images/BookMyOPD.png").p20(),
        // "Your Instant Path to Seamless Healthcare.".text.color(Colors.black).size(18).make(),
        
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyButton(
              onPressed: () {
                 Get.toNamed(SignUpRoute);
                //Get.toNamed(ContactRoute);
              },
              text: "Sign Up",
            ),
            const SizedBox(height: 15),
            MyBorderButton(
              text: "Sign In",
              onPressed: () {
                
                Get.toNamed(LoginRoute);
              },
            ),
            const SizedBox(height: 50),
          ],
        ).p8(),
      ],
    ));
  }
}
