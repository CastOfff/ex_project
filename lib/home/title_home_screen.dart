
import 'package:flutter/material.dart';

class TitleHomeScreen extends StatefulWidget {
  final String title;
  const TitleHomeScreen({super.key, required this.title});

  @override
  State<TitleHomeScreen> createState() => _TitleHomeScreenState();
}

class _TitleHomeScreenState extends State<TitleHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: Row(
            children: [
              Text('See all', style: TextStyle(fontSize: 16, color: Colors.grey),),
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey,)
            ],
          ),
        )
      ],
    );
  }
}
