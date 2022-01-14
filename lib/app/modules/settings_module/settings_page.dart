import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/settings_module/settings_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              // statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileHeader(
                title: "ABCD XYZ",
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    elevation: 0,
                    child: Icon(Icons.edit),
                    onPressed: () {},
                  )
                ],
              ),
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
                        subtitle: Text("abcajsdasd.ahsda@gmail.com"),
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
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Settings'),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                title: Text('Darkmode'),
                subtitle: Text('Off'),
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
                      FontAwesomeIcons.solidMoon,
                      color: Colors.black.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Notification'),
                subtitle: Text('On'),
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
                      FontAwesomeIcons.solidBell,
                      color: Colors.black.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Language'),
                subtitle: Text('English'),
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
                      FontAwesomeIcons.language,
                      color: Colors.black.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Change password'),
                //subtitle: Text(''),
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
                      FontAwesomeIcons.key,
                      color: Colors.black.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Application info'),
                //subtitle: Text(''),
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
                      FontAwesomeIcons.info,
                      color: Colors.black.withOpacity(.77),
                      size: 18,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  controller.logout();
                },
                child: ListTile(
                  title: Text('Logout'),
                  //subtitle: Text(''),
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
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.black.withOpacity(.77),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}

class ProfileHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const ProfileHeader(
      {Key? key, required this.title, this.subtitle, this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          child: SizedBox(),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: 'https://10.224.81.70:6443' +
                        ((Session.instance.user!.avatar != null)
                            ? Session.instance.user!.avatar!.thumbUrl!
                            : '/peachat/assets/dist/img/default-user-avatar.jpg'),
                    httpHeaders: {
                      'Authorization':
                          'Bearer ' + Session.instance.tokenResp!.accessToken!
                    },
                    errorWidget: (ctx, url, error) => CachedNetworkImage(
                      imageUrl:
                          'https://10.224.81.70:6443/peachat/assets/dist/img/default-user-avatar.jpg',
                      httpHeaders: {
                        'Authorization':
                            'Bearer ' + Session.instance.tokenResp!.accessToken!
                      },
                      errorWidget: (_, __, ___) => SizedBox(),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}
