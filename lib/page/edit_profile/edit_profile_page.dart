
import 'package:flutter/material.dart';

import '../../data/local_storage/user_preferences.dart';
import '../../data/model/user.dart';
import '../../data/repository/user_service.dart';
import 'edit_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService();
    final userPreferences = UserPreferences();
    TextEditingController editName = TextEditingController();
    TextEditingController editSdt = TextEditingController();
    TextEditingController editEmail = TextEditingController();
    editName.text = userPreferences.getUser().name ?? '';
    editSdt.text = userPreferences.getUser().phone ?? '';
    editEmail.text = userPreferences.getUser().email ?? '';

    Future<void> updateUser() async {
      User user = userPreferences.getUser();
      user.name = editName.text;
      user.phone = editSdt.text;
      user.email = editEmail.text;
      await userService.updateUser(user);
      await userPreferences.saveUser(user);
    }
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
                icon: const Icon(Icons.keyboard_backspace)),
        actions: [
          TextButton(
            onPressed: () async {
              await updateUser();
              Navigator.pop(context);
            },
            child: const Text(
              'Done',
            )
          )
        ],
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
