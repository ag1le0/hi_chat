import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBarSize = 75.0;
    final buttonSize = 56.0;
    final buttonMargin = 4.0;
    final topMargin = buttonSize / 2 + buttonMargin / 2;
    final canvasColor = CupertinoColors.white;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Material(
        child: Container(
          color: Colors.transparent,
          height: navigationBarSize + topMargin,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Stack(
            children: [
              Positioned.fill(
                top: topMargin,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: canvasColor,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(144, 151, 160, 0.1),
                          blurRadius: 25,
                          offset: Offset(0, 15))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeNavItem(
                        text: 'Chats',
                        iconData: Icons.chat_bubble,
                        selected: true,
                      ),
                      HomeNavItem(
                        text: 'Settings',
                        iconData: Icons.settings,
                        selected: false,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 252, 252, 1),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(buttonMargin / 2),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
