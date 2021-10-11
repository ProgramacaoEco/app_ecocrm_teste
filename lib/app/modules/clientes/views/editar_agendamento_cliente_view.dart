import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarAgendamentoClienteView extends GetView {
  final AgendamentoController agendamentoController =
      Get.put(AgendamentoController());
  final MenuController menuController = Get.put(MenuController());
  final ClientesController controller = Get.put(ClientesController());
  final InitiaValues values = Get.put(InitiaValues());

  // Variaveis que recebo como paramentro para editar
  int idAgendamento;
  int idCliente;
  var hora;
  String nome;
  String data;
  String observacao;

  EditarAgendamentoClienteView({
    @required this.idAgendamento,
    @required this.idCliente,
    @required this.data,
    @required this.nome,
    @required this.hora,
    @required this.observacao,
  });

  // TextEditingController para receber os valores que foram editados
  TextEditingController dataEdit = TextEditingController();
  TextEditingController horaEdit = TextEditingController();
  TextEditingController observacaoEdit = TextEditingController();

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
          'Editar Agendamento',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // SingleChildScrollView para a tela nao dar overflow e dentro possui os campos para editar o agendamento
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // TextFormFild da data do agendamento
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####")
                      ],
                      decoration: InputDecoration(labelText: 'Data'),
                      initialValue: '${data}',
                      keyboardType: TextInputType.number,
                      // onChanged que verifica os valores qnd for nulo atribui o value senao a data que esta na controller
                      onChanged: (value) {
                        dataEdit.text = value;
                        if (dataEdit.text != data) {
                          return data = dataEdit.text;
                        } else {
                          return data = data;
                        }
                      },
                    ),
                  ),
                ],
              ),
              // TextFormFild da hora do agendamento
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        //HoraInputFormatter()
                      ],
                      decoration: InputDecoration(labelText: 'Hora'),
                      initialValue: '${hora}',
                      keyboardType: TextInputType.number,
                      // onChanged que verifica os valores qnd for nulo atribui o value senao a data que esta na controller
                      onChanged: (value) {
                        horaEdit.text = value;
                        if (horaEdit.text != hora) {
                          return hora = horaEdit.text;
                        } else {
                          return hora = hora;
                        }
                      },
                    ),
                  ),
                ],
              ),
              // TextFormFild da Observação
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Observação'),
                      initialValue: '${observacao}',
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: null,
                      // onChanged que verifica os valores qnd for nulo atribui o value senao a data que esta na controller
                      onChanged: (value) {
                        observacaoEdit.text = value;
                        if (observacaoEdit.text != observacao) {
                          return observacao = observacaoEdit.text;
                        } else {
                          return observacao = observacao;
                        }
                      },
                    ),
                  ),
                ],
              ),
              // ElevatedButton com o metodo controller passando os paramentes para editar
              ElevatedButton(
                onPressed: () {
                  controller.putAgendamentoCliente(
                      data, hora, observacao, idCliente, idAgendamento);
                },
                child: Text("Salvar"),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
