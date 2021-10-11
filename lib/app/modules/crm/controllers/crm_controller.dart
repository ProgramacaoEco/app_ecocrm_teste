import 'package:crm_win_app/app/core/dio/custom_dio.dart';
import 'package:crm_win_app/app/models/clickModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrmController extends GetxController {
  var click = <ClickModel>[].obs;

  @override
  Future<void> onReady() async {
    
    super.onReady();
  }

  getAllClicks(idCliente) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    int idDistribuidor = prefs.getInt('id_distribuidor');

    return CustomDio.instance.get(
      '/click/${idDistribuidor}/${idCliente}}',
      options: Options(
        headers: {'Authorization': "Bearer ${token}"},
      ),
    )
        .then(
      (response) {
        var dados = response.data;
        print('Crm Click: ${response.data}');

        click.clear();
        for (var c in dados) {
          ClickModel clicks = new ClickModel(
              idCliente: c['id_cliente'],
              idDistribuidor: c['id_distribuidor'],
              idProduto: c['id_produto'],
              contagemClick: c['contagem_click'],
              idMaxinivel: c['id_maxinivel'],
              nome: c['nome'],
              nomeProduto: c['nome_produto']);

          click.add(clicks);
        }
        return click;
      },
    );
  }
}
