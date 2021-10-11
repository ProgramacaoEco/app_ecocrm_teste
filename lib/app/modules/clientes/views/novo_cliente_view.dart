import 'package:brasil_fields/brasil_fields.dart' as br;
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:crm_win_app/app/models/estadosModel.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/cidades_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/views/cidades_view.dart';

class NovoClienteView extends GetView<ClientesController> {
  final CidadesController navController = Get.put(CidadesController());
  final ClientesController clientController = Get.put(ClientesController());
  final MenuController menuController = Get.put(MenuController());
  final InitiaValues values = Get.put(InitiaValues());

  RxString selectedCity = ''.obs;

  TextEditingController nome = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController logradouro = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController cpfcnpj = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController uf = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController linkCrm = TextEditingController();
  TextEditingController infoComplementares = TextEditingController();
  TextEditingController thisCidade = TextEditingController();
  TextEditingController thisUf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
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
        leading: IconButton(
            onPressed: () {
              Get.back();
              values.setDefaultName('Esperando seleção da cidade');
              navController.setDefaultUf('UF');
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Novo cliente", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
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
                      controller: nome,
                      decoration: InputDecoration(
                        labelText: "Nome *",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cpfcnpj,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        br.CpfOuCnpjFormatter(),
                      ],
                      decoration: InputDecoration(labelText: "CPF/CNPJ"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####")
                      ],
                      controller: nascimento,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Data de nascimento *",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: logradouro,
                      decoration: InputDecoration(labelText: "Logradouro"),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: numero,
                        decoration: InputDecoration(labelText: "Número"),
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: bairro,
                      decoration: InputDecoration(labelText: "Bairro"),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ButtonTheme(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: navController.selected.value,
                              onChanged: (newValue) {
                                navController.setSelected(newValue);
                                navController.getByUf(newValue);
                                uf.text = newValue;
                                newValue == 'UF'
                                    ? Get.snackbar(
                                        'Atenção', 'Selecione um estado valido',
                                        backgroundColor: Colors.orange)
                                    : Get.to(() => CidadesView(uf: newValue));
                              },
                              items: Estados.listaEstadosSigla.map(
                                (item) {
                                  return new DropdownMenuItem(
                                    child: new Text(item),
                                    value: item,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => TextFormField(
                        decoration: InputDecoration(
                          hintText: "${values.cityName.value}",
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "#####-###")
                      ],
                      controller: cep,
                      decoration: InputDecoration(labelText: "CEP"),
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "(##)#####-####")
                      ],
                      controller: celular,
                      decoration: InputDecoration(
                        labelText: "Celular *",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mail,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      //controller: linkCrm,
                      decoration: InputDecoration(labelText: "Link CRM"),
                      initialValue: 'Gerado automaticamente após o cadastro!',
                      keyboardType: TextInputType.text,
                      enabled: false,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: infoComplementares,
                      maxLines: null,
                      maxLength: null,
                      decoration: InputDecoration(
                          labelText: "Informações sobre o Cliente"),
                    ),
                  ),
                ],
              ),
              Obx(() => controller.button == true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          if (nome.text.isEmpty ||
                              nascimento.text.isEmpty ||
                              celular.text.isEmpty) {
                            Get.snackbar('Atenção',
                                'Preencha os campos com * corretamente!',
                                backgroundColor: Colors.orange);
                          } else {
                            controller.button.toggle();
                            controller.storeClient(
                              nome.text,
                              nascimento.text,
                              logradouro.text,
                              numero.text,
                              cpfcnpj.text,
                              bairro.text,
                              uf.text,
                              cep.text,
                              celular.text,
                              mail.text,
                              infoComplementares.text,
                              values.cityId,
                            );
                            values
                                .setDefaultName('Esperando seleção da cidade');
                            navController.setDefaultUf('UF');
                          }
                        },
                        child: Text("Salvar"),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff17b0d6)),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ))
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }
}
