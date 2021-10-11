import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:crm_win_app/app/models/cidadeModel.dart';
import 'package:crm_win_app/app/models/clientModel.dart';
import 'package:crm_win_app/app/models/distribuidorModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RelatorioController extends GetxController {
  var clientes = <ClientModel>[].obs;
  List<String> idClientes = [];
  var distribuidor = <Distribuidor>[].obs;
  var idCliente;

  @override
  Future<void> onInit() async {
    getAllClients();
    super.onInit();
  }

  getAllClients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    int idDistribuidor = prefs.getInt('id_distribuidor');

    return CustomDio.instance.get(
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
          idClientes.add(client.idCliente.toString());
        }

        return clientes;
      },
    );
  }
}
