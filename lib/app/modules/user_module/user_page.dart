import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/modules/user_module/user_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class UserPage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
            color: Colors.black,
          ),
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.adaptive.more,
                color: Colors.black,
              ),
              itemBuilder: (context) {
                return [];
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              ProfileHeader(user: controller.user),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('User information'),
              ),
              const SizedBox(height: 10.0),
              Column(
                children: <Widget>[
                  Obx(() => Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(FontAwesomeIcons.userAlt),
                            title: Text("Username"),
                            subtitle: Text(
                                "@${controller.user.value.username ?? '...'}"),
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.birthdayCake),
                            title: Text("Birthday"),
                            subtitle: Text('none'),
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.solidEnvelope),
                            title: Text("Email"),
                            subtitle: Obx(
                              () => Text((controller.user.value.email == null ||
                                      controller.user.value.email!.isEmpty)
                                  ? 'none'
                                  : controller.user.value.email!),
                            ),
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.phone),
                            title: Text("Phone"),
                            subtitle: Text('none'),
                          ),
                          ListTile(
                            leading: Icon(FontAwesomeIcons.info),
                            title: Text("About me"),
                            subtitle: Text("none"),
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}

class ProfileHeader extends GetWidget<UserController> {
  final Rx<User> user;

  const ProfileHeader({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Avatar(media: user.value.avatar),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              user.value.nickName ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.sendAddFriendRequest();
                },
                child: Text('Kết bạn'),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Nhắn tin'),
              )
            ],
          )
        ],
      ),
    );
  }
}
