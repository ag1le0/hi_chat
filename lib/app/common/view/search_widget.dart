import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SEARCH);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            color: HexColor.fromHex('F5F8FC'),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: HexColor.fromHex('949BA5'),
              size: 24,
            ),
            SizedBox(
              width: 15,
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
    );
  }
}
