import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/routes/app_pages.dart';

import 'auth_controller.dart';

class GlobalMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    //return null;
    bool authed;

    if (authController.authenticated != null) {
      authed = authController.authenticated!;
      bool isLoginRoute = (route == Routes.LOGIN || route == Routes.REGISTER);

      if (authed && !isLoginRoute || route == null) {
        return null;
      }
      if (!authed && isLoginRoute) {
        return null;
      }
      if (authed && isLoginRoute) {
        return RouteSettings(name: Routes.LANDING);
      }
      if (!authed && !isLoginRoute) {
        return RouteSettings(name: Routes.LOGIN);
      }
    } else {
      authController.initMiddleWare();
    }
  }
}
