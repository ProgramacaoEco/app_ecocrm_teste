import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/agendamento/views/novo_agendamento.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectClientAgendamentoView extends GetView {
  final ClientesController controller = Get.put(ClientesController());
  final MenuController menuController = Get.put(MenuController());
  final AgendamentoController agendamentocontroller =
      Get.put(AgendamentoController());
  final InitiaValues values = Get.put(InitiaValues());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Selecione o cliente',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text('Carregando clientes...'),
              );
            default:
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final v = controller.clientes[index];
                  return ListTile(
                    title: Text('${v.nome.toString()}'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NovoAgendamento(
                            idCliente: v.idCliente,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
          }
        },
        future: controller.getAllClients(),
      ),
    );
  }
}
