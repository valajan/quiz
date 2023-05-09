import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Otaku+',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       // Code pour ouvrir l'écran de compte
      //     },
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //     icon: Icon(
      //       Icons.account_circle_rounded,
      //       size: 32.0,
      //       color: Colors.black,
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
