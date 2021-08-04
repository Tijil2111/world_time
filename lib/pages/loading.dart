import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {

    Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // print(response.body);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}