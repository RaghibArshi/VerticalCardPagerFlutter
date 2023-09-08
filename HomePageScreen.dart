import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:youtube_project/DetailPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Wonder Woman",
      "Captain America",
      "Hulk",
      "Iron Man",
      "Spider Man",
      "Thor",
    ];

    final List<String> imagePaths = [
      'assets/wondergirl.jpg',
      'assets/captainamerica.jpg',
      'assets/hulk.jpg',
      'assets/ironman.jpg',
      'assets/spiderman.jpg',
      'assets/thor.jpg',
    ];

    List<Widget> generateImages(List<String> imagePaths, double borderRadius) {
      return imagePaths.map((path) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            child: Image.asset(path, fit: BoxFit.fill),
          ),
        );
      }).toList();
    }

    final List<Widget> imageWidget = generateImages(imagePaths, 16.0);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: VerticalCardPager(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                titles: titles,
                images: imageWidget,
                onPageChanged: (page) {
                  print('List is scrolled');
                },
                align: ALIGN.CENTER,
                onSelectedItem: (index) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      DetailPage(image: imagePaths[index])));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
