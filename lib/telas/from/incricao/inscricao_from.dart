import 'package:flutter/material.dart';

class InscricaoForm extends StatelessWidget{
  @override

  TextEditingController _distritoController = TextEditingController();
  TextEditingController _setorController = TextEditingController();
  TextEditingController _qualdraController = TextEditingController();
  TextEditingController _loteController = TextEditingController();
  TextEditingController _subLoteController = TextEditingController();
  late TextEditingController _situacaoController = TextEditingController();
  late TextEditingController _pTController = TextEditingController();
  late TextEditingController _pCController = TextEditingController();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeiro Passo da Inscrição")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Distrito"
              ),
              controller: _distritoController,

            ),


          ]
        ),
      ),
      //extendBody: true,
      //extendBodyBehindAppBar: true,
    );
  }
}
