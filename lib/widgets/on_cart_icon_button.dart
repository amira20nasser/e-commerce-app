import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class OnTabIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onIconPressed;
  const OnTabIconButton(
      {super.key, required this.icon, required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      highlightColor: Colors.amber,
      iconSize: 20,
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 3,
        shadowColor: AppColors.orange,
        shape: const CircleBorder(),
      ),
      onPressed: onIconPressed,
      icon: icon,
    );
  }
}
