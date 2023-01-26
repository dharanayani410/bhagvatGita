import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      appBar: AppBar(
        title: Text(
          "Bhagvad Gita",
          style: TextStyle(color: Color(0xffD39D38)),
        ),
        leading: Container(),
        backgroundColor: Color(0xff6f0000),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, i) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Column(
                children: [
                  Text("Chapter ${Global.finalData[i]['chapter_id']}"),
                  Text("Verse ${Global.finalData[i]['verse_number']}")
                ],
              ),
              title: Text("${Global.finalData[i]['title']}"),
              subtitle: Text("${Global.finalData[i]['text']}"),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('detail', arguments: Global.finalData[i]);
              },
              tileColor: Color(0xff6f0000),
              textColor: Color(0xffD39D38),
            ),
          );
        },
        itemCount: Global.finalData.length,
      )),
    );
  }
}
