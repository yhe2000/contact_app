import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 26),
        width: 117,
        height: 39,
        alignment: Alignment.centerLeft,
        color: const Color(0xff29384D),
        child: Image.asset('assets/images/app_bar_image.png'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
