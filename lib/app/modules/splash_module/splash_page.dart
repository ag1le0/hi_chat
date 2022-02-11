import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/logo.dart';
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
          builder: (controller) => Scaffold(
            body: Stack(
              children: [
                // InitialBackgroundView(),
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
