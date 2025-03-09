import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedScreen(),
    );
  }
}

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('heellllo'),
          actions: [
            IconButton(
                onPressed: () async {
                  var url = Uri.https('67caf9da3395520e6af3dbc6.mockapi.io', 'users');
                  var response = await http.get(url);
                  final listJson = json.decode(response.body);
                  setState(() {
                    users = json.decode(response.body);
                  });
                  print(listJson.runtimeType);
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['avatar']),
                ),
                title: Text(user['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user['email']),
              ),
            );
          },
        ),
    );
  }
}
