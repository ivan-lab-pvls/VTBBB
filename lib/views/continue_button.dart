import 'package:flutter/material.dart';

class ContinueButton extends StatefulWidget {
  final PageController controller;
  final void Function() onTap;
  const ContinueButton({super.key, required this.controller, required this.onTap});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
        ),
        backgroundColor: const Color(0xFF06BCFE),
        minimumSize: Size(
          MediaQuery.sizeOf(context).width * .829,
          MediaQuery.sizeOf(context).height * .077,
        ),
      ),
      onPressed: widget.onTap,
      child: const Text(
        "CONTINUE",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      ),
    );
  }
}
