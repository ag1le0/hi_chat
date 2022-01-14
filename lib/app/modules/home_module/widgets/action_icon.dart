import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(.15),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.black.withOpacity(.77),
          size: 18,
        ),
      ),
    );
  }
}
