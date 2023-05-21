import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user.dart';

class UserController extends GetxController {
  var user = User(token: '', name: '').obs;

  final box = GetStorage();

  void login(String token, String name) {
    user.value = User(token: token, name: name);
    box.write('token', token);
  }

  void logout() {
    user.value = User(token: '', name: '');
    box.remove('token');
  }
}
