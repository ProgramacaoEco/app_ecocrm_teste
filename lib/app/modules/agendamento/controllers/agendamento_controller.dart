import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:crm_win_app/app/models/agendaModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as x;
import 'package:shared_preferences/shared_preferences.dart';

class AgendamentoController extends x.GetxController {
  var agendas = <AgendaModel>[].obs;
  List<AgendaModel> agendaClient = [];
  var button = true.obs;

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  //----------------------------------------------------------------------------------
  // Metodo GET para buscar todos os clientes do distribuidor pelo id do distribuidor
  //--------------------------------------------------------------------------------
  Future getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id_distribuidor = prefs.getInt('id_distribuidor');
    final token = prefs.getString('access_token');
    try {
      final response = await CustomDio.instance.get(
        '/agendamentos/distribuidor=${id_distribuidor}',
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );

      agendas.clear();

      final list = response.data as List;
      for (var a in list) {
        AgendaModel agenda = new AgendaModel.fromJson(a);
        agenda.cliente.nome == null
            ? agenda.cliente.nome = 'Vazio'
            : agenda.cliente.nome;

        agendas.add(agenda);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar('Erro', 'Sem autorização, tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        x.Get.snackbar('Erro', 'Ocorreu um erro inesperado!');
      }
    }
  }

  //----------------------------------
  // Metodo buscar agendamento pelo id do Cliente
  //----------------------------------
  Future getByClient(int id_cliente) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id_distribuidor = prefs.getInt('id_distribuidor');
    final token = prefs.getString('access_token');
    try {
      final response = await CustomDio.instance.get(
          '/agendamentos/distribuidor=${id_distribuidor}/cliente=${id_cliente}',
          options: Options(
            headers: {'Authorization': "Bearer ${token}"},
          ));
      final list = response.data as List;

      for (var item in list) {
        final agenda = AgendaModel.fromJson(item);
        agendas.addIf(agenda != null, agenda);
      }

      return this.agendas;
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar('Erro', 'Sem autorização, tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        print(e);
        x.Get.snackbar('Erro', 'Ocorreu um erro inesperado!');
      }
    }
  }

  //---------------------------------------------------------------------------------------------------------------------
  // Metodo criar novo agendamento onde pega por paramentre a data, hora , id do cliente e a descricao do agendamento
  //---------------------------------------------------------------------------------------------------------------------
  void storeAgenda(
      String date, String time, int id_cliente, String descricao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id_distribuidor = prefs.getInt('id_distribuidor');
    final token = prefs.getString('access_token');
    var formatted = date.split('/').reversed.join('-');
    var datetime = '${formatted} ${time}';

    var formData = FormData.fromMap(
      {
        'id_distribuidor': id_distribuidor,
        'data_agendamento': datetime,
        'descricao': descricao,
        'id_cliente': id_cliente
      },
    );
    try {
      final response = await CustomDio.instance.post(
          '/agendamentos',
          data: formData,
          options: Options(
            headers: {'Authorization': "Bearer ${token}"},
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        x.Get.offNamed('/menu');
        x.Get.snackbar('Sucesso!', 'Cliente cadastrado com sucesso!',
            backgroundColor: Colors.green);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar('Erro', 'Sem autorização, tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        print(e);
        x.Get.snackbar('Erro', 'Ocorreu um erro inesperado!');
      }
    }
  }

  //----------------------------------
  // Metodo editar agendamento
  //----------------------------------
  Future putAgenda(
    String date,
    String time,
    String descricao,
    int id_cliente,
    int id_agendamento,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    var formatted = date.split('/').reversed.join('-');
    var datetime = '${formatted} ${time}';
    

    try {
      final response = await CustomDio.instance.put(
        '/agendamento/editar',
        data: {
          'id_agendamento': id_agendamento,
          'data_agendamento': datetime,
          'descricao': descricao
        },
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      if (response.statusCode == 200) {
        button.value = true;
        x.Get.back();
        x.Get.back();
        x.Get.offNamed('/menu');
        x.Get.snackbar('Sucesso!', 'Agendamento editado com sucesso!',
            backgroundColor: Colors.green);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar(
            'Sem permissão', 'Sem autorização, tente logar novamente');
      } else if (e?.response?.statusCode == 500) {
        print(e);
        x.Get.snackbar('', 'Ocorreu um erro inesperado');
      }
    }
  }

  //---------------------------------
  //Metodo para deletar agendamento
  //---------------------------------
  Future deleteAgenda(int id_agenda) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    try {
      final response = await CustomDio.instance.delete(
        '/agendamento/destroy/${id_agenda}',
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        x.Get.back();
        x.Get.back();
        x.Get.offNamed('/menu');
        x.Get.snackbar('Sucesso!', 'Agendamento deletado com sucesso!',
            backgroundColor: Colors.green);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar(
            'Sem permissão', 'Sem autorização, tente logar novamente',
            backgroundColor: Colors.orange);
      } else if (e?.response?.statusCode == 500) {
        x.Get.snackbar('', 'Ocorreu um erro inesperado',
            backgroundColor: Colors.black);
      }
    }
  }

  //---------------------------------
  // Metodo para buscar agendamento do cliente pelo id dele
  //---------------------------------
  getAgendamento(int idCliente) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    try {
      final response = await CustomDio.instance.get(
        '/agendamentos/cliente/${idCliente}',
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      print(response.data);
      agendaClient.clear();
      final list = response.data as List;
      for (var a in list) {
        AgendaModel agenda = new AgendaModel.fromJson(a);
        agendaClient.add(agenda);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar('Erro', 'Sem autorização, tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        x.Get.snackbar('Erro', 'Ocorreu um erro inesperado!');
      }
    }
  }
}
