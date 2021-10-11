import 'package:crm_win_app/app/modules/crm/controllers/crm_controller.dart';
import 'package:crm_win_app/app/modules/crm/views/crm_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/relatorio_controller.dart';

class RelatorioView extends GetView<RelatorioController> {
  final RelatorioController controller = Get.put(RelatorioController());
  final CrmController crmController = Get.put(CrmController());

  var dropdownvalue = 'Geral'.obs;

  var list = [].obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff17b0d6),
                  Color(0xff17b0d6),
                  Color(0xff17b0d6),
                ],
              ),
            ),
          ),
          title: Text(
            "Relatório Geral",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                return showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Ajuda'),
                    content: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        children: [
                          Text(
                            '*A lista mostra apenas os cliente cadastrados. \n\n Caso o cliente desejado não apareça na lista, faça o movimento conforme imagem abaixo para atualizar!.',
                            textAlign: TextAlign.justify,
                          ),
                          Text(''),
                          Image.asset(
                            'images/image.png',
                            scale: 5,
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancelar'),
                        child: const Text('Voltar'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () => controller.getAllClients(),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.clientes.length,
                    itemBuilder: (context, index) {
                      final v = controller.clientes[index];
                      return ListTile(
                        title: Text('${v.nome.toString()}'),
                        onTap: () async {
                          print(v.idCliente);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CrmView(
                                idCliente: v.idCliente,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
