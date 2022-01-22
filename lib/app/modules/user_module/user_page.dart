import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/user_module/user_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class UserPage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(FontAwesomeIcons.userAlt),
                        title: Text("Username"),
                        subtitle: Text("@abcdefgh"),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.birthdayCake),
                        title: Text("Birthday"),
                        subtitle: Text("24/06/1999"),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.solidEnvelope),
                        title: Text("Email"),
                        subtitle: Obx(
                          () => Text(controller.user.value.email ?? ''),
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.phone),
                        title: Text("Phone"),
                        subtitle: Text("0223353124"),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.info),
                        title: Text("About me"),
                        subtitle: Text("none"),
                      ),
                    ],
                  )
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
          Obx(
            () => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: Api.host +
                  ((user.value.avatar != null)
                      ? user.value.avatar!.thumbUrl!
                      : '/peachat/assets/dist/img/default-user-avatar.jpg'),
              httpHeaders: {
                'Authorization':
                    'Bearer ' + Session.instance.tokenResp!.accessToken!
              },
              errorWidget: (ctx, url, error) => CachedNetworkImage(
                imageUrl: Api.host +
                    '/peachat/assets/dist/img/default-user-avatar.jpg',
                httpHeaders: {
                  'Authorization':
                      'Bearer ' + Session.instance.tokenResp!.accessToken!
                },
                errorWidget: (_, __, ___) => SizedBox(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              user.value.name ?? '',
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
