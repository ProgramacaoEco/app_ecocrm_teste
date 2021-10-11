import 'dart:async';
import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:crm_win_app/app/models/aniversariantesModel.dart';
import 'package:crm_win_app/app/models/cidadeModel.dart';
import 'package:crm_win_app/app/models/distribuidorModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as x;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crm_win_app/app/models/clientModel.dart';

class ClientesController extends x.GetxController {
  // --------------------------------------------------------------------------------------------------------
  // Variaveis da controller
  // --------------------------------------------------------------------------------------------------------
  var clientes = <ClientModel>[].obs;
  var distribuidor = <Distribuidor>[].obs;
  var aniversariantes = <aniversariantesModel>[].obs;
  var filterCliente = <ClientModel>[].obs;
  var tokenRefresh;
  var button = true.obs;

  @override
  Future<void> onInit() async {
    Timer.periodic(Duration(minutes: 30), (timer) {
      refreshToken();
    });
    getAllClients();
    getAllBirthday();
    super.onInit();
  }

  Future refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');

    return CustomDio.instance
        .get(
      '/refreshApp',
      options: Options(
        headers: {'Authorization': "Bearer ${token}"},
      ),
    )
        .then(
      (response) {
        print('Token renovado:  ${response.data}');
        if (response.statusCode == 200) {
          tokenRefresh = response.data['token'].toString();
          prefs.setString('access_token', tokenRefresh);
        }
      },
    );
  }

  // --------------------------------------------------------------------------------------------------------
  // Methodo GET buscar todos os clientes do distribuidor
  // --------------------------------------------------------------------------------------------------------
  getAllClients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    int idDistribuidor = prefs.getInt('id_distribuidor');
    prefs.setBool('login', true);

    return CustomDio.instance
        .get(
      '/clientes/distribuidor=${idDistribuidor}',
      options: Options(
        headers: {'Authorization': "Bearer ${token}"},
      ),
    )
        .then(
      (response) {
        var dados = response.data;

        print('GetAllClientes: ${response.data}');

        clientes.clear();

        for (var c in dados) {
          CidadesModel city = new CidadesModel(
            descricao:
                c['cidade'] == null ? 'Não infomado' : c['cidade']['descricao'],
          );
          Distribuidor distri =
              new Distribuidor(idMaxinivel: c['distribuidor']['id_maxinivel']);

          ClientModel client = new ClientModel(
              idCliente: c["id_cliente"],
              nome: c["nome"],
              bairro: c["bairro"],
              cep: c["cep"],
              complementar: c['complementar'],
              nascimento: c['nascimento'],
              logradouro: c['logradouro'],
              numero: c['numero'],
              uf: c['uf'],
              cidade: city,
              cpfCnpj: c["cpf_cnpj"],
              celular: c["celular"],
              email: c["email"],
              rg: c["rg"],
              distribuidor: distri);
          clientes.add(client);
          distribuidor.add(distri);
        }
        return clientes;
      },
    );
  }

  // ------------------------------------------------------
  // Methodo GET buscar todos aniversariantes do dia
  // ------------------------------------------------------
  getAllBirthday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    int idDistribuidor = prefs.getInt('id_distribuidor');

    return CustomDio.instance
        .get(
      '/clientes/aniversariantes/distribuidor=${idDistribuidor}',
      options: Options(
        headers: {'Authorization': "Bearer ${token}"},
      ),
    )
        .then(
      (response) {
        var dados = response.data;
        print(response.data);
        aniversariantes.clear();
        for (var c in dados) {
          CidadesModel city = new CidadesModel(
            descricao:
                c['cidade'] == null ? 'Não infomado' : c['cidade']['descricao'],
          );

          aniversariantesModel client = aniversariantesModel(
              idCliente: c["id_cliente"],
              nome: c["nome"],
              bairro: c["bairro"],
              cep: c["cep"],
              complementar: c['complementar'],
              nascimento: c['nascimento'],
              logradouro: c['logradouro'],
              numero: c['numero'],
              uf: c['uf'],
              cpfCnpj: c["cpf_cnpj"],
              celular: c["celular"],
              email: c["email"],
              rg: c["rg"],
              cidade: city);
          aniversariantes.add(client);
        }
        aniversariantes.toSet().toList();
        return aniversariantes;
      },
    );
  }

  // ----------------------------------------------------------------------------------
  // Metodo para criar novo cliente
  // ----------------------------------------------------------------------------------
  void storeClient(
    String nome,
    String nascimento,
    String logradouro,
    String numero,
    String cnpcnpj,
    String bairro,
    String uf,
    String cep,
    String celular,
    String mail,
    String infoComplementares,
    int idCidade,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("access_token");
    int id_distribuidor = prefs.getInt("id_distribuidor");

    cnpcnpj.isEmpty ? cnpcnpj = 'Nao informado' : cnpcnpj = cnpcnpj;
    logradouro.isEmpty ? logradouro = 'Nao informado' : logradouro = logradouro;
    numero.isEmpty ? numero = '' : numero = numero;
    bairro.isEmpty ? bairro = 'Nao informado' : bairro = bairro;
    uf.isEmpty ? uf = 'NI' : uf = uf;
    cep.isEmpty ? cep = 'Nao informado' : cep = cep;
    mail.isEmpty ? mail = 'Nao informado' : mail = mail;
    infoComplementares.isEmpty
        ? infoComplementares = 'Nao informado'
        : infoComplementares = infoComplementares;
    idCidade == null ? 7777777 : idCidade = idCidade;

    var formatted = nascimento.split('/').reversed.join('-');

    var data = FormData.fromMap(
      {
        'id_distribuidor': id_distribuidor,
        'nome': nome,
        'nascimento': formatted,
        'cpf_cnpj': cnpcnpj,
        "logradouro": logradouro,
        'numero': numero,
        'bairro': bairro,
        'uf': uf,
        'cep': cep,
        'celular': celular,
        'email': mail,
        'complementar': infoComplementares,
        'cidade': idCidade,
      },
    );
    try {
      var response = await CustomDio.instance.post('/cliente',
          options: Options(headers: {'Authorization': 'Baerer ${token}'}),
          data: data);
      if (response.statusCode == 201) {
        button.value = true;
        x.Get.back();
        x.Get.offNamed('/menu');
        x.Get.snackbar('Sucesso', 'Contato criado com sucesso',
            backgroundColor: Colors.green);
      }
    } on DioError catch (e) {
      print(e);
      if (e.response.statusCode == 401) {
        x.Get.snackbar('Sem autorização',
            'Seu token expirou, para sua segurança por favor tente relogar');
      } else if (e.response.statusCode == 500) {
        x.Get.snackbar('', 'Ocorreu um erro inesperado, tente novamente');
        print(e.response);
        print(e.type);
      }
    }
  }

  // --------------------------------------------------------------------------------------------------------
  // Methodo put para editar o agendamento dos clientes
  // --------------------------------------------------------------------------------------------------------
  Future putAgendamentoCliente(
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
          'data_agenda': datetime,
          'descricao': descricao
        },
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      if (response.statusCode == 200) {
        x.Get.offNamed('/menu');
        x.Get.snackbar('Atualize a Pagina', 'Sucesso agendamento editado!',
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

  // ---------------------------------------------------------------------------------------
  // Metodo de editar dados do cliente
  // ---------------------------------------------------------------------------------------
  Future putClient(
      int id_cliente,
      String nome,
      String nascimento,
      String logradouro,
      String numero,
      String cnpcnpj,
      String bairro,
      String uf,
      String cep,
      String celular,
      String mail,
      String infoComplementares,
      int idCidade) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("access_token");

    var formatted = nascimento.split('/').reversed.join('-');

    cnpcnpj == null ? cnpcnpj = 'Nao informado' : cnpcnpj = cnpcnpj;
    logradouro == null ? logradouro = 'Nao informado' : logradouro = logradouro;
    numero == null ? numero = '' : numero = numero;
    bairro == null ? bairro = 'Nao informado' : bairro = bairro;
    uf == null ? uf = 'NI' : uf = uf;
    cep == null ? cep = 'Nao informado' : cep = cep;
    mail == null ? mail = 'Nao informado' : mail = mail;
    infoComplementares == null
        ? infoComplementares = 'Nao informado'
        : infoComplementares = infoComplementares;

    var data = FormData.fromMap(
      {
        'nome': nome,
        'nascimento': formatted,
        'cpf_cnpj': cnpcnpj,
        "logradouro": logradouro,
        'numero': numero,
        'bairro': bairro,
        'uf': uf,
        'cep': cep,
        'celular': celular,
        'email': mail,
        'complementar': infoComplementares,
        'cidade': idCidade
      },
    );

    try {
      var response =
          await CustomDio.instance.post('/cliente/edite/${id_cliente}',
              options: Options(
                headers: {'Authorization': 'Baerer ${token}'},
              ),
              data: data);
      if (response.statusCode == 200) {
        button.value = true;
        x.Get.back();
        x.Get.back();
        x.Get.offNamed('/menu');
        x.Get.snackbar('Sucesso', 'Contato editado com sucesso!',
            backgroundColor: Colors.green);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        x.Get.snackbar('Erro!',
            'Token Expirado, para sua segurança faça o login novamente!',
            backgroundColor: Colors.orange);
      } else if (e.response.statusCode == 400) {
        x.Get.snackbar('Erro!', 'Nenhum dado alterado, tente novamente',
            backgroundColor: Colors.red);
      } else if (e.response.statusCode == 500) {
        x.Get.snackbar('Erro!', 'Ocorreu um erro inesperado, tente novamente',
            backgroundColor: Colors.red);
      }
    }
  }

  filterByName(String nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    int id_distribuidor = prefs.getInt("id_distribuidor");
    try {
      final response = await CustomDio.instance.post(
        '/clientes/likebyName/$id_distribuidor/$nome',
        options: Options(
          headers: {'Authorization': "Bearer ${token}"},
        ),
      );
      print(response.data);
      var dados = response.data;

      filterCliente.clear();

      for (var c in dados) {
        CidadesModel city = new CidadesModel(
          descricao:
              c['cidade'] == null ? 'Não infomado' : c['cidade']['descricao'],
        );

        ClientModel client = new ClientModel(
          idCliente: c["id_cliente"],
          nome: c["nome"],
          bairro: c["bairro"],
          cep: c["cep"],
          complementar: c['complementar'],
          nascimento: c['nascimento'],
          logradouro: c['logradouro'],
          numero: c['numero'],
          uf: c['uf'],
          cidade: city,
          cpfCnpj: c["cpf_cnpj"],
          celular: c["celular"],
          email: c["email"],
          rg: c["rg"],
        );
        filterCliente.add(client);
      }
      return filterCliente;
    } on DioError catch (e) {
      if (e?.response?.statusCode == 401) {
        x.Get.snackbar('Sem permissão', 'Tente logar novamente!');
      } else if (e?.response?.statusCode == 500) {
        print(e);
        x.Get.snackbar('Erro', 'Ocorreu um erro inesperado');
      }
    }
  }
}
