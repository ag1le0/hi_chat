import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/token_response.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/const.dart';
import 'package:pea_chat/app/utils/utils.dart';

class AuthController extends GetxController {
  final Rx<bool?> _authenticated = Rx(null);

  bool? get authenticated => _authenticated.value;
  set authenticated(value) => _authenticated.value = value;

  User? userInfo;
  TokenResp? token;

  @override
  void onInit() {
    super.onInit();
  }

  initMiddleWare() {
    Utils.initSharePre().then((value) async {
      authenticated = false;
      if (value.getString(TOKEN_PREF) != null) {
        token = TokenResp.fromJson(jsonDecode(value.getString(TOKEN_PREF)!));
        Session.instance.tokenResp = token;
        await Api.instance
            .getLoginInfo(bearToken: token!.accessToken)
            .then((value) {
          userInfo = value!.result;
          Session.instance.user = userInfo;
          String userPref = jsonEncode(userInfo);
          Utils.saveObject(USER_INFO, userPref);
          authenticated = true;
        }).catchError((onError) {
          if (onError is CustomException) {
            CustomException e = onError;
            log(e.message);
          } else {
            log('Some thing wrong' + onError.toString());
          }
        });
      }

      var route = Get.currentRoute;

      var isLoginRoute = (route == Routes.LOGIN || route == Routes.REGISTER);

      if (authenticated! && (isLoginRoute || route == Routes.SPLASH)) {
        Get.offAllNamed(Routes.LANDING);
      }
      if (!authenticated! && !isLoginRoute) {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }
}
