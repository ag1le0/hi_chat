import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/initial_background_view.dart';
import 'package:pea_chat/app/common/logo.dart';
import 'package:pea_chat/app/modules/register_module/register_controller.dart';
import 'package:pea_chat/app/theme/app_colors.dart';
import 'package:pea_chat/app/theme/app_text_theme.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        InitialBackgroundView(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    Row(
                      children: [
                        const Logo(),
                        const SizedBox(width: 30),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            'Hi Chat',
                            style: bigTitle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Register',
                      style: bigTitle,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.withOpacity(.3), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        label: Text('Username'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.withOpacity(.3), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        label: Text('Password'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.withOpacity(.3), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        label: Text('Confirm Password'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        // prefixIcon: SizedBox(
                        //   height: 0,
                        //   child: CountryCodePicker(
                        //     onChanged: print,
                        //     initialSelection: 'IT',
                        //     favorite: ['+84', 'VN'],
                        //     showFlag: true,
                        //     alignLeft: false,
                        //   ),
                        // ),
                        contentPadding: EdgeInsets.all(15),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.withOpacity(.3), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        label: Text('Phone number'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Material(
                      elevation: 2,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: fbColor,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: Get.width * .5,
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'Have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
