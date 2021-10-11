import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/login/controllers/login_controller.dart';
import 'package:crm_win_app/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';
import '../controllers/sair_controller.dart';

class SairBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SairController);
    Get.put(LoginController);
    Get.put(ClientesController);
    Get.put(SplashscreenController);
  }
}
