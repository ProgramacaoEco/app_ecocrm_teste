import 'package:crm_win_app/app/models/cidadeModel.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:brasil_fields/brasil_fields.dart' as br;
import 'package:crm_win_app/app/modules/clientes/controllers/cidades_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarDadosClienteView extends GetView {
  final ClientesController controller = Get.put(ClientesController());
  final CidadesController navController = Get.put(CidadesController());
  final MenuController menuController = Get.put(MenuController());
  final InitiaValues values = Get.put(InitiaValues());

  String nome;
  int idContato;
  String cpfcnpj;
  String nascimento;
  String logradouro;
  String numero;
  String bairro;
  CidadesModel cidade;
  int idCity;
  String uf;
  String cep;
  String celular;
  String mail;
  String infoComplementares;

  EditarDadosClienteView({
    @required this.nome,
    @required this.idContato,
    @required this.cpfcnpj,
    @required this.nascimento,
    @required this.logradouro,
    @required this.numero,
    @required this.bairro,
    @required this.cidade,
    @required this.uf,
    @required this.cep,
    @required this.celular,
    @required this.mail,
    @required this.infoComplementares,
    @required this.idCity,
  });

  TextEditingController nomeEdit = TextEditingController();
  TextEditingController cpfcnpjEdit = TextEditingController();
  TextEditingController nascimentoEdit = TextEditingController();
  TextEditingController logradouroEdit = TextEditingController();
  TextEditingController numeroEdit = TextEditingController();
  TextEditingController cidadeEdit = TextEditingController();
  TextEditingController bairroEdit = TextEditingController();
  TextEditingController ufEdit = TextEditingController();
  TextEditingController cepEdit = TextEditingController();
  TextEditingController celularEdit = TextEditingController();
  TextEditingController mailEdit = TextEditingController();
  TextEditingController infoComplementaresEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar dados',
          style: TextStyle(color: Colors.white),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Nome'),
                      initialValue: nome,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        nomeEdit.text = value;
                        if (nomeEdit.text != nome) {
                          return nome = nomeEdit.text;
                        } else {
                          return nome = nome;
                        }
                      },
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
                        br.CpfOuCnpjFormatter(),
                      ],
                      decoration: InputDecoration(labelText: 'CPF/CNPJ'),
                      initialValue: cpfcnpj,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        cpfcnpjEdit.text = value;
                        if (cpfcnpjEdit.text != cpfcnpj) {
                          return cpfcnpj = cpfcnpjEdit.text;
                        } else {
                          return cpfcnpj = cpfcnpj;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####"),
                      ],
                      decoration:
                          InputDecoration(labelText: 'Data de Nascimento'),
                      keyboardType: TextInputType.number,
                      initialValue: nascimento,
                      onChanged: (value) {
                        nascimentoEdit.text = value;
                        if (nascimentoEdit.text != nascimento) {
                          return nascimento = nascimentoEdit.text;
                        } else {
                          return nascimento = nascimento;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Logradouro'),
                      controller: TextEditingController(text: logradouro),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        logradouroEdit.text = value;
                        if (logradouroEdit.text != logradouro) {
                          return logradouro = logradouroEdit.text;
                        } else {
                          return logradouro = logradouro;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Numero'),
                      initialValue: numero,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        numeroEdit.text = value;
                        if (numeroEdit.text != numero) {
                          return numero = numeroEdit.text;
                        } else {
                          return numero = numero;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Bairro'),
                      initialValue: bairro,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        bairroEdit.text = value;
                        if (bairroEdit.text != bairro) {
                          return bairro = bairroEdit.text;
                        } else {
                          return bairro = bairro;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "UF"),
                        controller: TextEditingController(text: this.uf),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "Cidade"),
                        controller:
                            TextEditingController(text: this.cidade.descricao),
                        onChanged: (value) {
                          cidadeEdit.text = value;
                          if (cidadeEdit.text != cidade.descricao) {
                            return cidade.descricao = cidadeEdit.text;
                          } else {
                            return cidade.descricao = cidade.descricao;
                          }
                        },
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "(##)#####-####")
                      ],
                      decoration: InputDecoration(labelText: 'Celular'),
                      initialValue: celular,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        celularEdit.text = value;
                        if (celularEdit.text != celular) {
                          return celular = celularEdit.text;
                        } else {
                          return celular = celular;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                      initialValue: mail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        mailEdit.text = value;
                        if (mailEdit.text != mail) {
                          return mail = mailEdit.text;
                        } else {
                          return mail = mail;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Informações sobre o cliente'),
                    keyboardType: TextInputType.multiline,
                    initialValue: infoComplementares,
                    maxLines: null,
                    maxLength: null,
                    onChanged: (value) {
                      infoComplementaresEdit.text = value;
                      if (infoComplementaresEdit.text != infoComplementares) {
                        return infoComplementares = infoComplementaresEdit.text;
                      } else {
                        return infoComplementares = infoComplementares;
                      }
                    },
                  ),
                )
              ]),
              Obx(
                () => controller.button == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.putClient(
                              idContato,
                              nome,
                              nascimento,
                              logradouro,
                              numero,
                              cpfcnpj,
                              bairro,
                              uf,
                              cep,
                              celular,
                              mail,
                              infoComplementares,
                              idCity,
                            );
                          },
                          child: Text("Salvar"),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
