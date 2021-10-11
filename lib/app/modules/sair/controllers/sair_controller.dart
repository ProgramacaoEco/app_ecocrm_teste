import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SairController extends GetxController {
  void limpar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed('/login');
  }
}
