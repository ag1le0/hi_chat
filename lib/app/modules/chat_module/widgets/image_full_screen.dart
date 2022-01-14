import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageFullScreen extends StatelessWidget {
  const ImageFullScreen({Key? key, required this.url, this.header})
      : super(key: key);

  final String url;
  final Map<String, String>? header;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: url,
            httpHeaders: header,
          ),
        ),
      ),
    );
  }
}
