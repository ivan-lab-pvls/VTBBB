import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final bool isPressed;
  final index;
  const TopBar({super.key, required this.isPressed, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 3,
          width: MediaQuery.sizeOf(context).width * .22,
          child: ColoredBox(
           color: index == 0 ? Colors.blue.shade700 : const Color.fromARGB(255, 169, 203, 232).withOpacity(.4),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 3,
          width: MediaQuery.sizeOf(context).width * .22,
          child: ColoredBox(
            color: index == 1 ? Colors.blue.shade700 : const Color.fromARGB(255, 169, 203, 232).withOpacity(.4),
          ),
        ),
         SizedBox(
          height: 3,
          width: MediaQuery.sizeOf(context).width * .22,
          child: ColoredBox(
            color: isPressed ? Colors.blue.shade700 : const Color.fromARGB(255, 169, 203, 232).withOpacity(.4),
          ),
        )
      ],
    );
  }
}
