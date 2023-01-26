import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Container(
        color: Color(0xff6f0000),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color(0xff6f0000),
              child: Text(
                "VERSE IN DETAIL",
                style: TextStyle(fontSize: 25, color: Color(0xffD39D38)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Chapter ${data['chapter_number']}",
                  style: TextStyle(
                      color: Color(0xffD39D38).withOpacity(0.7), fontSize: 20),
                ),
                Text(
                  " ${data['title']}",
                  style: TextStyle(
                      color: Color(0xffD39D38).withOpacity(0.7), fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " ${data['text']}",
              style: TextStyle(
                  color: Color(0xffD39D38).withOpacity(0.5), fontSize: 15),
            ),
            Text(
              "${data['transliteration']}",
              style: TextStyle(
                  color: Color(0xffD39D38).withOpacity(0.5), fontSize: 15),
            ),
            Text(
              "${data['word_meanings']}",
              style: TextStyle(
                  color: Color(0xffD39D38).withOpacity(0.5), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
