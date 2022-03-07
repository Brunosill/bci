import 'package:flutter/material.dart';

class PessoaJuridicaList extends StatefulWidget{

  @override
  State<PessoaJuridicaList> createState() => _PessoaJuridicaListState();
}

class _PessoaJuridicaListState extends State<PessoaJuridicaList>{
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child:Column(
          children: <Widget>[
            Expanded(child: Text('ta indo'),),
          ]
        )
      )
    );
  }

}