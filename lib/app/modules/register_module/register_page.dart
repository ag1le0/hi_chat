import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/logo.dart';
import 'package:pea_chat/app/modules/register_module/register_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class RegisterPage extends GetView<RegisterController> {
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
                    SizedBox(height: ScreenUtil().setHeight(80)),
                    MiniLogo(),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: HexColor.fromHex('0F1828'),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(45)),
                    Form(
                        child: Column(
                      children: [
                        TextField(
                          controller: controller.usernameController,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: Text('Username'),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        TextField(
                          controller: controller.emailController,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: Text('Email'),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: Text('Password'),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        TextField(
                          controller: controller.passwordConfirmController,
                          obscureText: true,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: Text('Confirm Password'),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                    ),
                    InkWell(
                      onTap: () {
                        controller.register();
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
                        Text('Have account?'),
                        TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: HexColor.fromHex('00CB9A')),
                          ),
                          onPressed: () {
                            Get.until(
                                (route) => route.settings.name == Routes.LOGIN);
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
