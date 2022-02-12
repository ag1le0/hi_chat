import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/change_language_module/change_language_controller.dart';
import 'package:pea_chat/app/utils/extension.dart';

import '../../../res.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChangeLanguagePage extends GetView<ChangeLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Change language'),
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
                    controller.changeLanguage();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            //CupertinoSearchTextField(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildLangListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildLangListView() {
    var listBuild = <Widget>[];

    controller.langeList.forEach((key, value) {
      var flag = '';
      if (key == 'zh') {
        flag = Res.ic_china;
      } else if (key == 'vi') {
        flag = Res.ic_vn;
      } else if (key == 'en') {
        flag = Res.ic_eng;
      }
      var item = GestureDetector(
        onTap: () {
          if (controller.langeSelect.value != key) {
            controller.langeSelect.value = key;
          }
        },
        child: Obx(() => ListTile(
              title: Text(value),
              leading: flag.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      height: 32,
                      width: 32,
                      child: Image.asset(
                        flag,
                        fit: BoxFit.fill,
                      ),
                    )
                  : SizedBox(
                      height: 32,
                      width: 32,
                    ),
              trailing: controller.langeSelect.value == key
                  ? Icon(Icons.check_circle_outline_sharp,
                      color: HexColor.fromHex('#377CCE'))
                  : Icon(Icons.radio_button_off_sharp),
            )),
      );
      var divider = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(),
      );
      listBuild.add(item);
      listBuild.add(divider);
    });
    return listBuild;
  }
}
