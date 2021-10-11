import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:crm_win_app/app/models/cidadeModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CidadesController extends GetxController {
  final cidades = <CidadesModel>[].obs;

  final city = [];
  var selected = "UF".obs;
  var selectedCity = '';

  get() {
    return selectedCity;
  }

  void setSelected(var value) {
    selected.value = value;
  }

  setDefaultUf(var value){
    selected.value = value;
  }

  setDefaultCity(var value){
    selectedCity = value;
  }

  getCity(String val) {
    selectedCity = val;
    city.clear();
    city.add(selectedCity);
  }

  getByUf(String uf) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    try {
      final response = await CustomDio.instance.get(
        '/cidades/${uf}',
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      print(response.data);
      final list = response.data as List;

      cidades.clear();

      for (var item in list) {
        CidadesModel cidade = new CidadesModel.fromJson(item);
        cidades.add(cidade);
      }

      return cidades;
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        Get.snackbar('Sem permissão', 'Tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        print(e);
        Get.snackbar('Erro', 'Ocorreu um erro inesperado');
      }
    }
  }

  getByCity(String uf, String cidade) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    try {
      final response = await CustomDio.instance.get(
        '/cidades/${uf}/cidade=${cidade}',
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      print(response.data);
      final list = response.data as List;

      cidades.clear();

      for (var item in list) {
        CidadesModel cidade = new CidadesModel.fromJson(item);
        cidades.add(cidade);
      }

      return cidades;
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        Get.snackbar('Sem permissão', 'Tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        print(e);
        Get.snackbar('Erro', 'Ocorreu um erro inesperado');
      }
    }
  }
}
