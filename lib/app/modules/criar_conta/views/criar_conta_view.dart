import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/criar_conta_controller.dart';

class CriarContaView extends GetView<CriarContaController> {
  final CriarContaController contaController = Get.put(CriarContaController());
  TextEditingController idDistribuidor = TextEditingController();
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343D62),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff343D62),
              Color(0xff343D62),
              Color(0xff343D62),
              Color(0xff343D62),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child: Image.asset(
                      'images/logo.png',
                      height: 130,
                      width: 130,
                    ),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  ),
                ),
                Container(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'ID Distribuidor All-in',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            controller: idDistribuidor,
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 20),
                        ),
                        Container(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'Usuario All-in',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            controller: usuario,
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'Senha',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white),
                              controller: password,
                              obscureText: true,
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.createAccount(
                              idDistribuidor.text,
                              usuario.text,
                              password.text,
                            );
                            print(idDistribuidor.text);
                            print(usuario.text);
                            print(password.text);
                          },
                          child: Text(
                            "Criar Conta",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff17b0d6),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
