import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pea_chat/app/data/model/media_data.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/res.dart';

class Avatar extends StatelessWidget {
  Avatar(
      {Key? key,
      this.defaultImage = Res.default_user_avatar,
      required this.media,
      this.size = 100})
      : super(key: key);

  final double size;
  final String defaultImage;
  final MediaResponse? media;

  static group({MediaResponse? media}) {
    return Avatar(
      defaultImage: Res.default_group_avatar,
      media: media,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: HexColor.fromHex('F5F8FC'),
          borderRadius: BorderRadius.circular(size / 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: media != null
            ? CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: Api.host + media!.url!,
                httpHeaders: {
                  'Authorization':
                      'Bearer ' + Session.instance.tokenResp!.accessToken!
                },
                errorWidget: (ctx, url, error) => Image.asset(
                  defaultImage,
                  fit: BoxFit.cover,
                ),
              )
            : Image.asset(
                defaultImage,
                fit: BoxFit.cover,
              ));
  }
}
