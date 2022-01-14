import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: 'logo_hero',
        child: Image.asset(
          'assets/logo.png',
          height: ScreenUtil().setHeight(271),
          width: ScreenUtil().setHeight(262),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
