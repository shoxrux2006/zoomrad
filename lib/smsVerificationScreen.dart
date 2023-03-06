import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomrad/util/buttonAuth.dart';

class SmsVerificationScreen extends StatefulWidget {
  const SmsVerificationScreen({Key? key}) : super(key: key);

  @override
  State<SmsVerificationScreen> createState() => _SmsVerificationScreenState();
}

class _SmsVerificationScreenState extends State<SmsVerificationScreen> {
  final controller = TextEditingController();

  late Timer _timer;
  int _start = 59;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    controller.text = "";
    controller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xfff3f3f3),
            body: Column(children: [
              const SizedBox(
                height: 150,
              ),
              const Center(
                  child: Image(
                      width: 100,
                      image: AssetImage("assets/image/notify_icon.png"))),
              const SizedBox(
                height: 60,
              ),
              const Center(
                  child: Text(
                "Quyidagi telefon raqamiga sms-kod yuborildi",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
              const Center(
                  child: Text("+998901114706",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    decoration: const InputDecoration.collapsed(
                        border: InputBorder.none,
                        hintText: 'SMS-kodni kiriting',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20)),
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    controller: controller,
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Column()),
                  Text(
                    "0:${_start > 10 ? _start : "0$_start"}",
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Image(
                                width: 20,
                                image:
                                    AssetImage("assets/image/phone_logo.png")),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "kodni qayta\nyuborish",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Column()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonAuth("Tasdiqlash", true, () {
              })
            ])));
  }
}
