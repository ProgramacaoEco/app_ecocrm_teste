import 'package:get/get.dart';
import '../controllers/criar_conta_controller.dart';

class CriarContaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CriarContaController>(
      () => CriarContaController(),
    );
  }
}
