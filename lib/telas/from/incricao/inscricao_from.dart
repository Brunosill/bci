import 'package:bci/modelos/base_modelo/inscricao.dart';
import 'package:flutter/material.dart';

class InscricaoForm extends StatelessWidget{
  @override

  String value1 = '00';
  late TextEditingController _distritoController = TextEditingController();

  late TextEditingController _setorController = TextEditingController();
  late TextEditingController _qualdraController = TextEditingController();
  late TextEditingController _loteController = TextEditingController();
  late TextEditingController _subLoteController = TextEditingController();
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
            ), //distrito
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Setor'
              ),
              controller: _setorController,
            ), //setor
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Qualdra'
              ),
              controller: _qualdraController,
            ), //qualdra
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Lote'
              ),
              controller: _loteController,
            ), //lote
            TextFormField(
              decoration: InputDecoration(
                labelText: 'S. Lote'
              ),
              controller: _subLoteController,
            ), //sublote
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Situação'
              ),
              controller: _situacaoController,
            ), //situacao
            TextFormField(
              decoration: const InputDecoration(
                labelText:  'Proprietario Terreno'
              ),
              controller: _pTController,
            ), // proprietario Terreno
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Proprietario Construida'
              ),
              controller: _pCController
            ), // Proprietario construida
            /*TextButton(
              child: Text('Salvar')
            )*/
          ]
        ),

      ),
      //extendBody: true,
      //extendBodyBehindAppBar: true,
    );

  }

  void _salvaIncricao(BuildContext context){
    final String nInscricao = '01010140080000';
    final int distrito = int.parse(_distritoController.text);
    final int setor = int.parse(_setorController.text);
    final int qualdra = int.parse(_qualdraController.text);
    final int lote = int.parse(_loteController.text);
    final int subLote = int.parse(_subLoteController.text);
    final String situacao = _situacaoController.text;
    final String proprietarioTerreno = _pTController.text;
    final String proprietarioConstrucao = _pCController.text;
    final Inscricao novaInscricao = Inscricao(
      nInscricao,
      distrito,
      setor,
      qualdra,
      lote,
      subLote,
      situacao,
      proprietarioTerreno,
      proprietarioConstrucao
    );

  }
}
