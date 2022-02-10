import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/logo.dart';
import 'package:pea_chat/app/modules/login_module/login_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        body: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(34),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(114)),
                    Logo(),
                    SizedBox(height: ScreenUtil().setHeight(48)),
                    Form(
                        child: Column(
                      children: [
                        TextField(
                          controller: controller.usernameController,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            // fillColor: Colors.white,
                            // contentPadding: EdgeInsets.all(15),
                            // errorBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Colors.red.withOpacity(.3), width: 1)),
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Colors.grey.withOpacity(.3),
                            //         width: 1)),
                            // border: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Colors.grey.withOpacity(.3),
                            //         width: 1)),
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide:
                            //         BorderSide(color: Colors.blue, width: 1)),
                            label: Text('Username'),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Obx(() => TextField(
                              controller: controller.passwordController,
                              obscureText: controller.hidePassword.value,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.all(15),
                                  // errorBorder: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //         color: Colors.red.withOpacity(.3), width: 1)),
                                  // enabledBorder: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //         color: Colors.grey.withOpacity(.3),
                                  //         width: 1)),
                                  // border: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //         color: Colors.grey.withOpacity(.3),
                                  //         width: 1)),
                                  // focusedBorder: OutlineInputBorder(
                                  //     borderSide:
                                  //         BorderSide(color: Colors.blue, width: 1)),
                                  label: Text('Password'),
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.hidePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      controller.hidePassword.value =
                                          !controller.hidePassword.value;
                                    },
                                  )),
                            )),
                      ],
                    )),
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                    ),
                    InkWell(
                      onTap: () {
                        controller.login(controller.usernameController.text,
                            controller.passwordController.text);
                        //Get.toNamed(Routes.LANDING);

                        //controller.download();
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(52),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: HexColor.fromHex('0AE4B0'),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(52)),
                            boxShadow: [
                              BoxShadow(
                                  color: HexColor.fromHex('000000')
                                      .withOpacity(.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ]),
                        child: Center(
                          child: Text(
                            'Start Messaging',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have account?'),
                        TextButton(
                          child: Text(
                            'Register',
                            style: TextStyle(color: HexColor.fromHex('00CB9A')),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: ScreenUtil().setHeight(17),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
