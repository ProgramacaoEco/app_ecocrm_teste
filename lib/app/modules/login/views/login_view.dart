import 'package:crm_win_app/app/modules/criar_conta/views/criar_conta_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());
  TextEditingController login = new TextEditingController();
  TextEditingController senha = new TextEditingController();

  @override
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
                Container(
                  child: Image.asset('images/logo.png'),
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Login',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                    controller: login,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 60),
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
                      controller: senha,
                      obscureText: true,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0x17b0d6)),
                        ),
                        onPressed: () {
                          controller.login(login.text, senha.text);
                        },
                        child: Text('Logar')),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0x17b0d6)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CriarContaView(),
                          ),
                        );
                      },
                      child: Text('Criar Conta'),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ],
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        ),
      ),
    );
  }
}
