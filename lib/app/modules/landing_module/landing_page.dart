import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/contacts_module/contacts_page.dart';
import 'package:pea_chat/app/modules/home_module/home_page.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/modules/settings_module/settings_page.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LandingPage extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Obx(() => IndexedStack(
                    index: controller.mainIndex.value,
                    children: [
                      HomePage(),
                      ContactsPage(),
                      SettingsPage(),
                    ],
                  ))),
          //HomeNavigationBar(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.commentDots), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.users), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.cog), label: 'Settings'),
            ],
            onTap: (value) {
              controller.mainIndex.value = value;
            },
            currentIndex: controller.mainIndex.value,
          )),
    );
  }
}
