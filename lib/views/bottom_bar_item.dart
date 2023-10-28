import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final void Function() onTap;
  final int index;
  final int currentIndex;
  final String img1;
  final String img2;

  const BottomBarItem({super.key, required this.onTap, required this.index, required this.img1, required this.img2, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image(
        image: AssetImage(
          currentIndex == index
              ? img1
              : img2,
        ),
        width: 50,
      ),
    );
  }
}
