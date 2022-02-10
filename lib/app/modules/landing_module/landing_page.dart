import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/contacts_module/contacts_page.dart';
import 'package:pea_chat/app/modules/home_module/home_page.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/utils/signaling.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/in_call.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/offer_call.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/ring_ring.dart';
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
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white));
    return _buildLanding();
  }

  Widget _buildMain() {
    switch (controller.videoCallController.callState) {
      case CallState.CallStateNew:
        return OfferCall();
      case CallState.CallStateRinging:
        return RingRing();
      case CallState.CallStateConnected:
        return InCall();
      default:
        return _buildLanding();
    }
  }

  Scaffold _buildLanding() {
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
      bottomNavigationBar: Material(
        elevation: 8,
        child: Obx(() => Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.green,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.mark_chat_unread_outlined),
                      label: 'Chat'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.groups_outlined), label: 'Contacts'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined), label: 'Settings'),
                ],
                onTap: (value) {
                  controller.mainIndex.value = value;
                },
                currentIndex: controller.mainIndex.value,
              ),
            )),
      ),
    );
  }
}
