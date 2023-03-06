import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  String text;
  bool enabled;
  Function onTap;

  ButtonAuth(this.text, this.enabled, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enabled) {
          onTap();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color:
                (enabled ? const Color(0xff21ae7a) : const Color(0xffb7b7b7)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
