import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/cidades_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CidadesView extends GetView {
  final InitiaValues values = Get.put(InitiaValues());
  final MenuController menuController = Get.put(MenuController());
  final CidadesController controller = Get.put(CidadesController());
  final AgendamentoController navController = Get.put(AgendamentoController());
  final ClientesController clientController = Get.put(ClientesController());

  String city;
  String uf;
  CidadesView({
    @required this.uf,
  });

  TextEditingController cidade = TextEditingController();
  TextEditingController cidadeEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5A3508),
                    Color(0xFF411A03),
                    Color(0xFF200805),
                  ],
                ),
              ),
            ),
            title: Text('Selecione a cidade'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.getByCity(uf, city);
                        },
                        icon: Icon(Icons.search)),
                    hintText: 'Digite para pesquisar',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    //fillColor: colorSearchBg,
                  ),
                  onChanged: (value) {
                    city = value;
                  },
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.cidades.length,
                    itemBuilder: (context, index) {
                      final v = controller.cidades[index];
                      return ListTile(
                        title: Text(v.descricao),
                        onTap: () async {
                          values.setValues(v.descricao, v.idCidade);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
