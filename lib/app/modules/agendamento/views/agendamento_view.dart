import 'package:crm_win_app/app/modules/agendamento/views/dados_agendamento_view.dart';
import 'package:crm_win_app/app/modules/agendamento/views/select_client_agendamento_view.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/agendamento_controller.dart';

class AgendamentoView extends GetView<AgendamentoController> {
  final AgendamentoController navController = Get.put(AgendamentoController());
  final MenuController menuController = Get.put(MenuController());
  final ClientesController clientController = Get.put(ClientesController());
  final InitiaValues values = Get.put(InitiaValues());

// Recebe no construtor o IdCliente
  int idCliente;

  AgendamentoView({
    this.idCliente,
  });

  @override
  Widget build(BuildContext context) {
    // Retorna o scafold padrão com a App ba nas cores que foram definidas
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
            "Agendamentos",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff17b0d6),
          // Botões de adicionar novo cliente e ajuda
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectClientAgendamentoView(),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                return showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Ajuda'),
                    content: Text(
                        'Clique no + para você criar um novo agendamento. \n\nCaso você deseja editar ou deletar um agendamento, basta apenas selecionar na lista e na proxima pagina clique no icone de editar no canto superior direito ou no deletar caso deseje!',
                        textAlign: TextAlign.justify),
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
        ),
        // Column que possui o FutureBuilder para carregar a lista dos agendamentos
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () => controller.getAll(),
                  child: ListView.builder(
                    itemCount: controller.agendas.length,
                    itemBuilder: (context, index) {
                      final v = controller.agendas[index];
                      final dateAndTime = v.dataAgendamento;
                      final split = dateAndTime.split(' ');
                      final Map<int, String> values = {
                        for (int i = 0; i < split.length; i++) i: split[i]
                      };
                      var formated = values[0].split('-').reversed.join('/');
                      var hour = values[1];
                      var a = hour.toString().replaceFirst(':', '-');
                      var b = a.replaceAll(':00', '');
                      var c = b.replaceAll('-', ':');
                      // Slidable para deletar arrastando para o lado esquerdo
                      return ListTile(
                        title: Text('${v.cliente.nome}'),
                        subtitle: Text('${formated} | ${c}'),
                        onTap: () async {
                          // Manda os dados por paramentro para a rota de DadosAgendamento para quando ser clicado aparecer as informaçoes
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DadosAgendamentoView(
                                nome: v.cliente.nome,
                                data: formated,
                                hora: c,
                                idAgendamento: v.idAgendamento,
                                idCliente: v.idCliente,
                                observacao: v.descricao,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
