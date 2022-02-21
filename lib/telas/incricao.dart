import 'package:bci/telas/from/inscricao_form.dart';
import 'package:bci/telas/from/pessoafisica_form.dart';
import 'package:flutter/material.dart';

class Inscricao extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Incrição de Imovel"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Dados do Proprietario', icon: Icon(Icons.person_outline)),
              Tab(text: 'Dados Imovel', icon: Icon(Icons.home_work_sharp))
            ]
          )
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: PessoaFisicaForm()
            ),
            Center(
              child:InscricaoForm(),
            )
          ]
        )
      )
    );
  }
}