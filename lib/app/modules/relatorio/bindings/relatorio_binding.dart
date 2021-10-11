import 'package:crm_win_app/app/modules/crm/controllers/crm_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:crm_win_app/app/modules/sair/controllers/sair_controller.dart';
import 'package:get/get.dart';

import '../controllers/relatorio_controller.dart';

class RelatorioBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RelatorioController);
    Get.put(MenuController);
    Get.put(SairController);
    Get.put(CrmController);
  }
}
