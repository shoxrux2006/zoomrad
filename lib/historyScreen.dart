import 'package:flutter/material.dart';
import 'package:zoomrad/util/buttonAuth.dart';
import 'package:zoomrad/util/customSwitch.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _enable = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xfff3f3f3),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 80,
                  backgroundColor: const Color(0xfff3f3f3),
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Column()),
                        GlobalSumWidget("8000", "Tushumlar", true),
                        Expanded(flex: 1, child: Column()),
                        GlobalSumWidget("-20000", "Chiqimlar", false),
                        Expanded(flex: 1, child: Column()),
                      ],
                    ),
                  ),
                ),
                
              ],
            )));
  }

  Widget GlobalSumWidget(String sum, String type, bool isGrow) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Icon(
            isGrow ? Icons.arrow_downward : Icons.arrow_upward,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            children: [
              Text(
                sum,
                style: TextStyle(
                    fontSize: 13,
                    color: isGrow ? Color(0xff21ae7a) : Color(0xff931214)),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget DisabledPolicy() {
    return Column(
      children: [
        Expanded(flex: 1, child: Column()),
        const Center(
          child: Image(
            height: 100,
            width: 100,
            image: AssetImage("assets/image/history_logo.png"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Xizmatdan foydalanish uchun To'lovlar",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        const Center(
          child: Text(
            "monitoringi servisini yoqing",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        Expanded(flex: 1, child: Column()),
        Row(children: [
          Expanded(flex: 1, child: Column()),
          const Text(
            "Men ommaviy oferta ",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          const Text(
            "shartlariga",
            style: TextStyle(color: Color(0xff21ae7a), fontSize: 12),
          ),
          const Text(
            " roziman",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          const SizedBox(
            width: 20,
          ),
          CustomSwitch(
            value: _enable,
            onChanged: (bool val) {
              setState(() {
                _enable = val;
              });
            },
          ),
          Expanded(flex: 1, child: Column()),
        ]),
        const SizedBox(
          height: 20,
        ),
        ButtonAuth("Yoqish", !_enable, () {}),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
