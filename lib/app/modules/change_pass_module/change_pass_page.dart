import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/change_pass_module/change_pass_controller.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/app/utils/keyboard.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChangePassPage extends GetView<ChangePassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Change password'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(19)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    KeyboardUtil.hideKeyboard(context);
                    if (controller.cpFormKey.currentState!.validate()) {
                      controller.changePass();
                    }
                  },
                  child: Container(
                    //width: ScreenUtil().setWidth(83),
                    height: ScreenUtil().setHeight(40),
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20)),
                    decoration: BoxDecoration(
                        color: HexColor.fromHex('377CCE').withOpacity(.1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setHeight(8)))),
                    child: Center(
                      child: Text(
                        'Change',
                        style: TextStyle(
                            color: HexColor.fromHex('377CCE'),
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            //CupertinoSearchTextField(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                    vertical: ScreenUtil().setHeight(20)),
                child: GestureDetector(
                  onTap: () => KeyboardUtil.hideKeyboard(context),
                  child: Form(
                    key: controller.cpFormKey,
                    child: Column(
                      children: [
                        Obx(
                          () => TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                'Current password',
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  !controller.hideOldPass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  controller.hideOldPass.toggle();
                                },
                              ),
                            ),
                            obscureText: controller.hideOldPass.value,
                            controller: controller.cpOldPass,
                            validator: (value) => value!.trim().isEmpty
                                ? 'Input current password'
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'New password',
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(!controller.hidePass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    controller.hidePass.toggle();
                                  },
                                ),
                              ),
                              obscureText: controller.hidePass.value,
                              controller: controller.cpPass,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Input new password';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() => controller.hidePass.value
                            ? TextFormField(
                                decoration: InputDecoration(
                                  label: Text(
                                    'Confirm password',
                                  ),
                                ),
                                obscureText: true,
                                controller: controller.cpCfPass,
                                validator: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'Input confirm password';
                                  else if (controller.hidePass.value &&
                                      value.trim() !=
                                          controller.cpCfPass.text.trim()) {
                                    return 'Confirm password not match';
                                  } else {
                                    return null;
                                  }
                                })
                            : SizedBox()),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
