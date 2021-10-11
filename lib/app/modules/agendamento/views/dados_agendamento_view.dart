import 'package:brasil_fields/brasil_fields.dart';
import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/agendamento/views/editar_agendamento_view.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:crm_win_app/app/modules/sair/controllers/sair_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosAgendamentoView extends GetView {
  final AgendamentoController controller = Get.put(AgendamentoController());
  final MenuController menuController = Get.put(MenuController());
  final ClientesController clientescontroller = Get.put(ClientesController());
  final SairController sairController = Get.put(SairController());

  // Variaveis que recebo os argumentos para pegar os dados do cliente selecionada
  int idAgendamento;
  int idCliente;
  var hora;
  String nome;
  String data;
  String observacao;

  DadosAgendamentoView({
    @required this.idAgendamento,
    @required this.idCliente,
    @required this.data,
    @required this.nome,
    @required this.hora,
    @required this.observacao,
  });

  @override
  Widget build(BuildContext context) {
    // Retorna o scafold padrão com a App bar nas cores que foram definidas
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
          'Dados do Agendamento',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // Botao que passa como argumentos as variaveis a abaixo para mostrar o agendamento selecionado
          IconButton(
            onPressed: () {
              var a = hora.toString().replaceFirst(':', '-');
              var b = a.replaceAll(':00', '');
              var c = b.replaceAll('-', ':');
              Get.to(() => EditarAgendamentoView(
                  idAgendamento: idAgendamento,
                  idCliente: idCliente,
                  data: data,
                  nome: nome,
                  hora: c,
                  observacao: observacao));
            },
            icon: Icon(Icons.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              return showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Confirmação'),
                  content: const Text('Quer deletar este agendamento?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        controller.deleteAgenda(this.idAgendamento);
                      },
                      child: const Text('Sim'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Não'),
                      child: const Text('Não'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // SingleChildScrollView para a tela nao dar overflow e dentro possui os campos para mostrar os dados do agendamento
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // TextFild nome do cliente
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Nome"),
                      controller: TextEditingController(text: nome),
                      keyboardType: TextInputType.text,
                      enabled: false,
                    ),
                  ),
                ],
              ),
              // TextFild data do agendamento
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####")
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Data"),
                      controller: TextEditingController(text: data),
                      enabled: false,
                    ),
                  ),
                ],
              ),
              // TextFild hora do agendamento
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        HoraInputFormatter()
                      ],
                      //controller: hora,
                      decoration: InputDecoration(labelText: "Hora"),
                      controller: TextEditingController(text: hora),
                      enabled: false,
                    ),
                  ),
                ],
              ),
              // TextFild das oberservaçoes
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Observação"),
                      controller: TextEditingController(text: observacao),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: null,
                      enabled: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
