
import 'package:flutter/material.dart';

import 'edit_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController editName = TextEditingController();
    editName.text = 'Khanh Nguyen';
    TextEditingController editSdt = TextEditingController();
    editSdt.text = '0987654321';
    TextEditingController editEmail = TextEditingController();
    editEmail.text = 'lamanhcuong.hus@gmail.com';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading:
            IconButton(
                onPressed: () {
                   Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_backspace)),
        actions: [Text('Done')],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 20,
          children: [
            const SizedBox(height: 20,),
            const Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            const SizedBox(height: 20,),
            EditField(
              controller: editName,
              focusNode: FocusNode(),
              hintText: 'Name',
            ),
            EditField(
              controller: editSdt,
              focusNode: FocusNode(),
              hintText: 'sdt',
            ),
            EditField(
              controller: editEmail,
              focusNode: FocusNode(),
              hintText: 'email',
            ),
          ],
        ),
      ),
    );
  }
}
