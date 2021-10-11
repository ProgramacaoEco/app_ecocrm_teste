import 'package:get/get.dart';

class InitiaValues extends GetxController {
  var cityName = 'Esperando seleção da cidade'.obs;
  var cityId = 0;

  void setValues(String nome, int id) {
    cityName.value = nome;
    cityId = id;
  }

  void setDefaultName(var value) {
    cityName.value = value;
  }
}