import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/detail.dart';

import 'myapp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      'myApp': (context) => const MyApp(),
      'detail': (context) => const Detail()
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  loadJSON() async {
    Global.jsonData =
        await rootBundle.loadString('asset/json/bhagvadgita.json');
  }

  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/Bhagvat-Gita-English.jpg',
              height: 400,
              width: 400,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6f0000),
                    padding: EdgeInsets.symmetric(horizontal: 50)),
                onPressed: () async {
                  List decodeData = jsonDecode(Global.jsonData);
                  setState(() {
                    Global.finalData = decodeData;
                  });
                  Navigator.of(context).pushNamed('myApp');
                },
                child: Text(
                  "OPEN",
                  style: TextStyle(color: Color(0xffD39D38)),
                )),
          ],
        ),
      ),
    );
  }
}

class Global {
  static String jsonData = '';
  static List finalData = [];
}
