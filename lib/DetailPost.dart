import 'package:flutter/material.dart';

class DetailPost extends StatelessWidget {
  List listData;
  int index;

  DetailPost(this.listData, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Post"),
      ),
      body: ListView(
        children: <Widget>[
          Text(listData[index].title),
          Text(listData[index].body)
        ],
      ),
    );
  }
}
