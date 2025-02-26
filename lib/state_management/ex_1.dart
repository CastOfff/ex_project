
import 'package:flutter/material.dart';

class Ex1 extends StatefulWidget {
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  late Color color;
  late String title;

  @override
  void initState() {
    // TODO: implement initState
    color = Colors.grey;
    title = 'Inactive';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stateful Widget',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            color == Colors.grey ? color = Colors.green : color = Colors.grey;
            title == 'Inactive' ? title = 'Active' : title = 'Inactive';
            setState(() {});
          },
          child: Container(
            height: 200,
            width: 200,
            color: color,
            child: Center(child: Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)),
          ),
        )
      ),
    );
  }
}
