import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/cidades_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/crm/controllers/crm_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:crm_win_app/app/modules/sair/controllers/sair_controller.dart';
import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
      () => SplashscreenController(),
    );
    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
    Get.lazyPut<CidadesController>(
      () => CidadesController(),
    );
    Get.lazyPut<ClientesController>(
      () => ClientesController(),
    );
    Get.lazyPut<AgendamentoController>(
      () => AgendamentoController(),
    );

    Get.lazyPut<SairController>(
      () => SairController(),
    );
    Get.lazyPut<CrmController>(
      () => CrmController(),
    );
  }
}
