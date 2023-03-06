import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          const Center(
              child: Image(
                  width: 100,
                  image: AssetImage("assets/image/notify_icon.png"))),
          const SizedBox(
            height: 20,
          ),
          button("O'zbekcha", () {}),
          const SizedBox(
            height: 20,
          ),
          button("Русский", () {}),
          Flexible(flex: 2, child: Column()),
        ],
      ),
    ));
  }

  Widget button(String text, void click()) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
