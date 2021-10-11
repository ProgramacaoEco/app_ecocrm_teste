import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:get/get.dart';
import '../controllers/clientes_controller.dart';

class ClientesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientesController);
    Get.put(MenuController);
  }
}
