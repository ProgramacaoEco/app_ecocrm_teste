import 'package:crm_win_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sair_controller.dart';

class SairView extends GetView<SairController> {
  final SairController navController = Get.put(
    SairController(),
  );
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('Voce quer realmente sair?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff17b0d6),
                ),
                onPressed: () {
                  controller.limpar();
                },
                child: Text(
                  'Sim',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff17b0d6),
                ),
                onPressed: () {
                  Get.snackbar('', 'Apenas volte para a tela que deseja!');
                },
                child: Text(
                  'Não',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
