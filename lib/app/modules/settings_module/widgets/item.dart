import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/utils/extension.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem(
      {Key? key,
      required this.title,
      required this.icon,
      this.subtitle,
      this.onTap,
      this.hideExpandIcon = false})
      : super(key: key);

  final String title;
  final String? subtitle;
  final Icon icon;
  final bool hideExpandIcon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
                color: HexColor.fromHex('DEDEDE').withOpacity(.70), width: 1),
            borderRadius: BorderRadius.circular(14)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: icon),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 17,
                        color: HexColor.fromHex('212226'),
                        fontWeight: FontWeight.normal),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle!,
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColor.fromHex('949BA5'),
                          fontWeight: FontWeight.normal),
                    ),
                  ]
                ],
              ),
            ),
            if (!hideExpandIcon)
              Container(
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Icon(Icons.expand_more)),
          ],
        ),
      ),
    );
  }
}
