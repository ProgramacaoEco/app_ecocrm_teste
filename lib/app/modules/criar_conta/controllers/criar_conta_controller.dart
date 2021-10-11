import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarContaController extends GetxController {

  createAccount(String idDistribuidor, String usuario, String password) async {
    try {
      var response = await CustomDio.instance.post(
        '/makeAppUser',
        data: {
          'id_maxinivel': idDistribuidor,
          'usuario': usuario,
          'password': password
        },
      );
      print(response.data);

      if (response.statusCode == 201) {
        Get.back();
        Get.snackbar('Sucesso', 'Conta criada com sucesso!',
            backgroundColor: Colors.green);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 400) {
        Get.snackbar('Erro', 'ID Maxinel Inexistente!',
            backgroundColor: Colors.red);
      } else if (e.response.statusCode == 422) {
        Get.snackbar('Erro', 'Verifique seus dados e tente novamente!',
            backgroundColor: Colors.orange);
      } else if (e.response.statusCode == 403) {
        Get.snackbar('Erro', 'Nome de usuario já existente!',
            backgroundColor: Colors.orange);
      } else {
        print(e);
        print(e.response);
        print(e.type);
        Get.snackbar('Erro', 'Erro interno reinicie a aplicação',
            backgroundColor: Colors.red);
      }
    }
  }
}
