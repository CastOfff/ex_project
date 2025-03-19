
import 'package:flutter/material.dart';
import '../../../../../core/widget/verify_common_button.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 5 / 6;
    return SizedBox(
      width: drawerWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: drawerWidth - 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
            ),
          )
        ],
      ),
    );
  }
}
