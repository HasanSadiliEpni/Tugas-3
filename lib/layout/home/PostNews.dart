import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/layout/model/Albums.dart';

class Postnews extends StatefulWidget {
  const Postnews({super.key});

  @override
  State<Postnews> createState() {
    return _PostnewsState();
  }
}

class _PostnewsState extends State<Postnews> {

  Future<Albums> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8', 
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      return Albums.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create album');
    }
  }



  final TextEditingController _controller = TextEditingController();
  Future<Albums>? _futureAlbum;
  
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Create Data Example',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Create Data Example'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureAlbum == null) 
            ? buildColumn() : buildFutureBuilder(),
      ),
    ), 
  );
}

  Column buildColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Enter Title',
        ), 
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            _futureAlbum = createAlbum(_controller.text);
          });
        },
        child: const Text('Create Data'),
      ), 
    ], 
  );
}

FutureBuilder<Albums> buildFutureBuilder() {
  return FutureBuilder<Albums>(
    future: _futureAlbum,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.title);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return const CircularProgressIndicator();
    },
  );
}


}
