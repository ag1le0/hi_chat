import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/search_widget.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/add_friend_module/add_friend_controller.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AddFriendPage extends GetView<AddFriendController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add friend'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SearchWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your username: '),
                  Text(
                    '${Session.instance.user!.username}',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ListTile(
                onTap: () {
                  Utils.showToast('Developing...', context);
                },
                contentPadding: EdgeInsets.all(0),
                title: Text('Scan'),
                subtitle: Text('Scan your friend QR Code'),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(.15),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.blue.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                onTap: () {
                  Utils.showToast(
                      'Sorry, this function is developing!', context);
                },
                contentPadding: EdgeInsets.all(0),
                title: Text('Find in contacts'),
                subtitle: Text('Find by phone number in contacts'),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(.15),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.solidUser,
                      color: Colors.orange.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                onTap: () {
                  Utils.showToast('Developing...', context);
                },
                contentPadding: EdgeInsets.all(0),
                title: Text('Nearby'),
                subtitle: Text('Find near you by location'),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(.15),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.grey.withOpacity(1),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
