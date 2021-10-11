import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:crm_win_app/app/modules/sair/controllers/sair_controller.dart';
import 'package:get/get.dart';

import '../controllers/crm_controller.dart';

class CrmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientesController>(
      () => ClientesController(),
    );
    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
    Get.lazyPut<SairController>(
      () => SairController(),
    );
    Get.lazyPut<CrmController>(
      () => CrmController(),
    );
  }
}
