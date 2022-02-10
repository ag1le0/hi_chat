import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gmo_media_picker/media_picker.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/settings_module/settings_controller.dart';
import 'package:pea_chat/app/modules/settings_module/widgets/item.dart';
import 'package:pea_chat/app/utils/extension.dart';

import '../../../res.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: HexColor.fromHex('#00CB9A'),
            expandedHeight: 200,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  top: 30,
                  right: 40,
                  child: Image.asset(
                    Res.profile_header,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: ProfileHeader(
                    title: Session.instance.user!.name!,
                    //subtitle: Session.instance.user!.username!,
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: HexColor.fromHex('#00CB9A'),
              height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              ProfileItem(
                title: 'User Info',
                icon: Icon(
                  FontAwesomeIcons.userEdit,
                  color: HexColor.fromHex('18A0FB'),
                  size: 18,
                ),
                subtitle: Session.instance.user!.nickName,
              ),
              ProfileItem(
                title: 'Notification',
                icon: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.orange,
                  size: 18,
                ),
                subtitle: 'On',
              ),
              ProfileItem(
                title: 'Language',
                icon: Icon(
                  FontAwesomeIcons.language,
                  color: HexColor.fromHex('67CE67'),
                  size: 18,
                ),
                subtitle: 'English',
              ),
              ProfileItem(
                title: 'Change Password',
                icon: Icon(
                  FontAwesomeIcons.key,
                  color: Colors.orange,
                  size: 18,
                ),
              ),
              ProfileItem(
                onTap: () async {
                  controller.logout();
                },
                hideExpandIcon: true,
                title: 'Logout',
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const ProfileHeader({Key? key, required this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.find();
    return Column(
      children: <Widget>[
        Container(
          height: 112,
          width: 112,
          child: Stack(
            children: [
              Positioned.fill(
                child: Avatar(
                  media: Session.instance.user!.avatar,
                  size: 112,
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          GmoMediaPicker.picker(
                            context,
                            isMulti: false,
                            type: RequestType.image,
                            isReview: true,
                            singleCallback: (AssetEntity asset) async {
                              File? image = await asset.file;
                              if (image != null) {
                                controller.uploadAvatar(image);
                              }
                            },
                          );
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 24,
                          color: HexColor.fromHex('323232'),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 5.0),
          Text(
            subtitle!,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ],
    );
  }
}
