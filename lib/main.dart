import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ListPostUI.dart';
import 'model/Post.dart';

// request untuk ambil data dari internet
// data masa depan / data yang akan digunakan nanti
Future<List> getPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var listPost = List<Post>();
    Iterable list = json.decode(response.body);

    listPost = list.map((model) => Post.fromJson(model)).toList();
    return listPost;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      home: MyHomeScreen(),
    ));

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Future<List> post;

  @override
  void initState() {
    super.initState();
    post = getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simpel Post"),
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ShowListUI(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
