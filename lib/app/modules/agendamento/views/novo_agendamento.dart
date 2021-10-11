import 'package:brasil_fields/brasil_fields.dart';
import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:crm_win_app/app/modules/menu/views/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NovoAgendamento extends GetView {
  final AgendamentoController controller = Get.put(AgendamentoController());
  final MenuController menuController = Get.put(MenuController());
  final ClientesController clientController = Get.put(ClientesController());
  final InitiaValues values = Get.put(InitiaValues());

  // Variavel idCliente para criar novo agendamento
  int idCliente;

  NovoAgendamento({
    @required this.idCliente,
  });

  // TextEditingController da data,hora, e observacao para pegar os valores e criar agendamento
  TextEditingController data;
  TextEditingController hora;
  TextEditingController observacao;

  @override
  Widget build(BuildContext context) {
    data = new TextEditingController();
    hora = new TextEditingController();
    observacao = new TextEditingController();

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
          "Novo agendamento",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff17b0d6),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####")
                      ],
                      controller: data,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Data *",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        HoraInputFormatter()
                      ],
                      keyboardType: TextInputType.number,
                      controller: hora,
                      decoration: InputDecoration(
                        labelText: "Hora *",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: observacao,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: null,
                      decoration: InputDecoration(
                        labelText: "Observação *",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (data.text == null ||
                      hora.text == null ||
                      observacao.text == null) {
                    Get.snackbar('Erro!', 'Preencha os campos corretamente!',
                        backgroundColor: Colors.blue);
                  } else {
                    controller.storeAgenda(
                        data.text, hora.text, idCliente, observacao.text);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MenuView()),
                        (Route<dynamic> route) => false);
                  }
                },
                child: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
