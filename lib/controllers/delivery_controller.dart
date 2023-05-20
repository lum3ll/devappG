import 'package:get/get.dart';

class DeliveryController extends GetxController {
  var deliveryList = [].obs;

  void addDelivery(String delivery) {
    deliveryList.add(delivery);
  }

  void delDelivery(String delivery) {
    deliveryList.remove(delivery);
  }
}
