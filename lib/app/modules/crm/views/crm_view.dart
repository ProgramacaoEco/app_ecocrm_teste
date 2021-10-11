import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/crm_controller.dart';

class CrmView extends GetView<CrmController> {
  final CrmController navController = Get.put(CrmController());

  final int idCliente;

  CrmView({Key key, this.idCliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
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
          title: Text('Relatório detalhado',
              style: TextStyle(color: Colors.white)),
        ),
        body: FutureBuilder(
            future: controller.getAllClicks(idCliente),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final v = navController.click[index];
                    return ListTile(
                      title: Text('${v.nomeProduto.toString()}'),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Clicks'),
                            Text('${v.contagemClick}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                );
              }
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }),
      ),
    );
  }
}
