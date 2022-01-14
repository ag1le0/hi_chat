import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/initial_background_view.dart';
import 'package:pea_chat/app/common/logo.dart';
import 'package:pea_chat/app/modules/login_module/login_bindings.dart';
import 'package:pea_chat/app/modules/login_module/login_page.dart';
import 'package:pea_chat/app/modules/splash_module/splash_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return GetBuilder(
          init: SplashController(),
          initState: (state) {
            Future.delayed(Duration(seconds: 1)).then((value) {
              Get.to(() => LoginPage(),
                  duration: Duration(milliseconds: 2500),
                  transition: Transition.fade,
                  binding: LoginBinding());
            });
          },
          builder: (controller) => Scaffold(
            body: Stack(
              children: [
                InitialBackgroundView(),
                const Center(
                  child: Logo(),
                ),
              ],
            ),
          ),
        );
      },
      designSize: Size(390, 844),
    );
  }
}
