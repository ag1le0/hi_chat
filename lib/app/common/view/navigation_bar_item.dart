import 'package:flutter/material.dart';

class HomeNavItem extends StatelessWidget {
  const HomeNavItem({
    Key? key,
    this.iconData,
    this.text,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  final IconData? iconData;
  final String? text;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final selectedColor = Colors.blue;
    final unselectedColor = Colors.grey;
    final color = selected ? selectedColor : unselectedColor;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: color),
          Text(text!, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
