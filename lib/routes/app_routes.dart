import 'package:blood_donation/view/LoginView.dart';
import 'package:blood_donation/view/aboutView.dart';
import 'package:blood_donation/view/appointView.dart';
import 'package:blood_donation/view/chanePasswordView.dart';
import 'package:blood_donation/view/completeView.dart';
import 'package:blood_donation/view/contactDetailView.dart';
import 'package:blood_donation/view/findDoctorView.dart';
import 'package:blood_donation/view/forgetView.dart';
import 'package:blood_donation/view/homeView.dart';
import 'package:blood_donation/view/hospitaldetailView.dart';
import 'package:blood_donation/view/immediatorView.dart';
import 'package:blood_donation/view/signUpView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/editProfileView.dart';
import 'routes_name.dart';

final appRoutes = [
  GetPage(name: ImmediateRoute, page: () => const ImmediatorView()),
  GetPage(
      name: ImmediateRoute,
      page: () => const ImmediatorView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: HomeRoute, page: () => HomeView(), middlewares: [AuthMiddleWare()]),
  GetPage(
      name: LoginRoute,
      page: () => const LoginView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: SignUpRoute,
      page: () => const SignUpView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: ForgetRoute,
      page: () => const ForgetView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: AllRoute,
      page: () => CompleteView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: ChangePasswordRoute,
      page: () => const ChangePasswordView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: EditProfileRoute,
      page: () => const EditProfileView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: ContactRoute,
      page: () => const ContactDetailView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: FindDoctorRoute,
      page: () => const FindDoctorView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: AppointRoute,
      page: () => const AppointView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: AboutRoute,
      page: () => const AboutView(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: HopitalDetailRoute,
      page: () => const HospitalDetailView(id: 1),
      middlewares: [AuthMiddleWare()]),
];

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
