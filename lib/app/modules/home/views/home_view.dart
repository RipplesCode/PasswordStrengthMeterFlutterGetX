import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Strength'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            onChanged: (value) {
              controller.checkPasswordStregth(value);
            },
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Password'),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => LinearProgressIndicator(
              value: controller.passwordStrength.value,
              backgroundColor: Colors.grey[300],
              color: controller.passwordStrength.value <= 1 / 4
                  ? Colors.red
                  : controller.passwordStrength.value == 2 / 4
                      ? Colors.amber
                      : controller.passwordStrength.value == 3 / 4
                          ? Colors.deepPurpleAccent
                          : Colors.green,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => Text(
                controller.displayText.value,
                style: TextStyle(fontSize: 18),
              ))
        ]),
      ),
    );
  }
}
