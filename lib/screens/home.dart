import 'package:delivery_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';
import '../controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.find();
  final DeliveryController deliveryController = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Delivery'),
        actions: [
          GestureDetector(
              child: const Icon(Icons.logout),
              onTap: () {
                Get.to(LoginPage());
                userController.logout();
              })
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() =>
                      Text('Bentornato, ${userController.user.value.name}')),
                  Obx(() => Text(
                      'Il tuo token di accesso è: ${userController.user.value.token}')),
                ])),
        Obx(() => Expanded(
              child: ListView.builder(
                itemCount: deliveryController.deliveryList.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(deliveryController.deliveryList[index]),
                    trailing: ElevatedButton(
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        deliveryController.delDelivery(
                            deliveryController.deliveryList[index]);
                      },
                    ),
                  );
                },
              ),
            ))
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          int deliveryNumber = deliveryController.deliveryList.length + 1;
          deliveryController.addDelivery('Delivery $deliveryNumber');
        },
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           // Your action for first button
      //         },
      //         child: Text('Button 1'),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           // Your action for second button
      //         },
      //         child: Text('Button 2'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
