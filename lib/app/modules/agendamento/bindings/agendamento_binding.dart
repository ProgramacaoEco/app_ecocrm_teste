import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:get/get.dart';
import '../controllers/agendamento_controller.dart';

class AgendamentoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientesController>(
      () => ClientesController(),
      fenix: true,
    );
    Get.lazyPut<AgendamentoController>(
      () => AgendamentoController(),
      fenix: true,
    );
    Get.lazyPut<MenuController>(
      () => MenuController(),
      fenix: true,
    );
  }
}
