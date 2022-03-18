import 'package:bci/web/webapi/cep_api.dart';
import 'package:flutter/material.dart';

import '../modelos/cep_web.dart';

class TesteCep extends StatefulWidget{

  @override
  State<TesteCep> createState() => _TesteCepState();
}

class _TesteCepState extends State<TesteCep> {
  final CepApi _dao = CepApi();

  late TextEditingController cepContoller = TextEditingController();
  late TextEditingController logradouroController = TextEditingController();
  late TextEditingController bairroController = TextEditingController();
  late TextEditingController localidadeController = TextEditingController();
  late TextEditingController ufController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('text cep busca')
      ),
      body:Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('cep'),
                    ),
                    keyboardType: TextInputType.number,
                    controller: cepContoller,
                  ),
                ),
                TextButton(
                  child: Icon(
                      Icons.search_outlined
                  ),
                  onPressed: (){
                    _dao.findAll(cepContoller.text).then((cepWeb) => (
                    localidadeController = TextEditingController(text: cepWeb.localidade.toString())
                    ));
                  },
                ),

              ]
            ),
          ),
          TextField(
            decoration: InputDecoration(
                label: Text('Cidade')
            ),
            keyboardType: TextInputType.text,
            controller: localidadeController,
          )
        ]
      )
    );
  }
}