import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var token;
  var expireToken;
  int idDistribuidor;

  void login(String usuario, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response = await CustomDio.instance
          .post('/loginApp', data: {'usuario': usuario, 'password': password});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        token = response.data['access_token'].toString();
        idDistribuidor = response.data['usuario']['id_distribuidor'];

        prefs.setString('access_token', token);
        prefs?.setBool("isLoggedIn", true);
        prefs.setInt('id_distribuidor', idDistribuidor);
        Get.offAllNamed("/menu");
        Get.snackbar('Sucesso', 'Login realizado com sucesso!',
            backgroundColor: Colors.green);
      }
    } catch (e) {
      if (e.response.statusCode == 401 || e.response.statusCode == 422) {
        Get.snackbar('Erro', 'Verifique seus dados e tente novamente!',
            backgroundColor: Colors.orange);
      } else {
        Get.snackbar('Erro', 'Erro interno reinicie a aplicação',
            backgroundColor: Colors.red);
      }
    }
  }
}
