import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pea_chat/res.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: 'logo_hero',
        child: Image.asset(
          Res.logo,
          height: ScreenUtil().setHeight(271),
          width: ScreenUtil().setHeight(262),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MiniLogo extends StatelessWidget {
  const MiniLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: 'logo_hero',
        child: Image.asset(
          Res.mini_logo,
          height: ScreenUtil().setHeight(100),
          width: ScreenUtil().setHeight(110),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
