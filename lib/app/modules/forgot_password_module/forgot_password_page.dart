import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/forgot_password_module/forgot_password_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ForgotPassword Page')),
      body: Container(
        child: Obx(() => Container(
              child: Text(controller.obj),
            )),
      ),
    );
  }
}
