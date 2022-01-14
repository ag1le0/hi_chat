import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/add_friend_module/add_friend_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
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
        elevation: .15,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SEARCH);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: HexColor.fromHex('F5F8FC'),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.search,
                      color: HexColor.fromHex('949BA5'),
                      size: 24,
                    ),
                    Text(
                      'Tìm kiếm',
                      style: TextStyle(
                        color: HexColor.fromHex('949BA5'),
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Your ID card: ${Session.instance.user!.username}'),
            const SizedBox(height: 10.0),
            ListTile(
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
                    color: Colors.black.withOpacity(.77),
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ListTile(
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
                    FontAwesomeIcons.qrcode,
                    color: Colors.black.withOpacity(.77),
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ListTile(
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
                    FontAwesomeIcons.qrcode,
                    color: Colors.black.withOpacity(.77),
                    size: 18,
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
