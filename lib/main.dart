import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List hits = [];

  Future<void> fetchImage() async {
    Response response = await Dio().get(
        "https://pixabay.com/api/?key=27800538-58daa56a9d6c9dd5623a0726f&q=yellow+flowers&image_type=photo");
    hits = response.data["hits"];
    setState(() {}); //画面更新
  }

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: hits.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[500],
            child: Center(child: Image.network(hits[index]["previewURL"])),
          );
        },
      ),
    );
  }
}
