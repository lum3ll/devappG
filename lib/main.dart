import 'package:delivery_app/controllers/delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery App GetX',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final DeliveryController deliveryController = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Delivery')),
      body: Obx(
        () => ListView.builder(
          itemCount: deliveryController.deliveryList.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(deliveryController.deliveryList[index]),
              trailing: ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  deliveryController
                      .delDelivery(deliveryController.deliveryList[index]);
                },
              ),
            );
          },
        ),
      ),
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
