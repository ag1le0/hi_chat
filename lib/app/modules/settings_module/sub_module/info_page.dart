import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/settings_module/settings_controller.dart';
import 'package:pea_chat/app/utils/extension.dart';

class InfoPage extends GetWidget<SettingsController> {
  const InfoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Hero(
          tag: 'appbarhero',
          child: AppBar(
            foregroundColor: Colors.black87,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: Text(
              'User Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: HexColor.fromHex('333E63'),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            //CupertinoSearchTextField(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemInfo(
                    tittle: 'Username',
                    des: Session.instance.user!.username!,
                  ),
                  Divider(),
                  ItemInfo(
                    tittle: 'Full name',
                    des: Session.instance.user!.name!,
                  ),
                  Divider(),
                  ItemInfo(
                    tittle: 'Nickname',
                    des: Session.instance.user!.nickName!,
                  ),
                  Divider(),
                  ItemInfo(
                    tittle: "Email",
                    des: Session.instance.user!.email ?? 'none',
                  ),
                  Divider(),
                  ItemInfo(
                    tittle: 'Phone number',
                    des: Session.instance.user!.callNumber ?? 'none',
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  final String tittle;
  final String des;

  const ItemInfo({Key? key, required this.tittle, required this.des})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setWidth(10),
          horizontal: ScreenUtil().setHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                tittle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )),
          Expanded(
              flex: 3,
              child: Text(
                des,
                style: TextStyle(
                  fontSize: 14,
                ),
              ))
        ],
      ),
    );
  }
}
