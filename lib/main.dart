import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FevoriteStarWidget extends StatefulWidget {
  final int star;
  final bool fevorite;
  const FevoriteStarWidget(
      {Key? key, required this.star, required this.fevorite})
      : super(key: key);

  @override
  _FevoriteStarState createState() => _FevoriteStarState();
}

class _FevoriteStarState extends State<FevoriteStarWidget> {
  // 当前用户时候喜欢该篇文章
  bool _isFevorite = true;
  int _fevoriteCount = 40;

  void _toggleFevoriteStar() {
    setState(() {
      // 当触发按钮时,当前值是喜欢,那么就是不喜欢的的操作反之亦然
      if (_isFevorite) {
        _fevoriteCount--;
        _isFevorite = false;
      } else {
        _fevoriteCount++;
        _isFevorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: (_isFevorite
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)),
          color: Colors.yellow,
          onPressed: _toggleFevoriteStar,
        ),
        Text(_fevoriteCount.toString()),
      ],
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  final String author;
  final int star = 0;
  const Title(
      {Key? key, required this.title, required this.author, required int star})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  author,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ])),
          const FevoriteStarWidget(fevorite: true, star: 40)
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  Column buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(context, Icons.call, 'CALL'),
        buildButtonColumn(context, Icons.near_me, 'ROUTE'),
        buildButtonColumn(context, Icons.share, 'SHARE'),
      ],
    );
  }
}

class Content extends StatelessWidget {
  final String content;
  const Content({Key? key, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        content,
        softWrap: true,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('这是我的第一个demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            const Title(title: "title", author: "autor", star: 1),
            const Buttons(),
            const Content(content: "文本内容"),
          ],
        ),
      ),
    );
  }
}
