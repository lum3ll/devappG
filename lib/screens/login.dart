import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access to Test Delivery'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            userController.login('T123456789', 'Luke');
            Get.to(HomePage());
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
