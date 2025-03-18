
import 'package:flutter/material.dart';
import '../../../../../core/widget/verify_common_button.dart';
import '../../../../../data/local_storage/user_preferences.dart';

class AvatarWidget extends StatefulWidget {
  final String titleButton;
  final String name;
  final void Function() onPressed;
  const AvatarWidget({super.key, required this.titleButton, required this.name, required this.onPressed});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerifyCommonButton(
              title: widget.titleButton,
              width: 80,
              height: 30,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              onPressed: () {
                widget.onPressed();
              },
            )
          ],
        )
      ],
    );
  }
}
