import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'compomentelist/corpolistpf.dart';

class PessoaFisicaList extends StatefulWidget {
  PessoaFisicaList({Key? key}) : super(key: key);

  @override
  State<PessoaFisicaList> createState() => _PessoaFisicaListState();
}

class _PessoaFisicaListState extends State<PessoaFisicaList> {
  final PessoaFisicaDao _dao = PessoaFisicaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FutureBuilder<List<PessoaFisica>>(
            initialData: [],
            future: Provider.of<PessoaFisicaDao>(context).findAll(),
            builder: (context, snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ]
                    )
                  );
                case ConnectionState.done:
                  if(snapshot.data != null){
                    final List<PessoaFisica>? pessoasFisicas = snapshot.data;
                    return
                  }
              }
            }
          )
        ]
      )
    );
  }
}

class _proprietarioItem extends StatefulWidget{

  final PessoaFisica proprietario;
  const _proprietarioItem(this.proprietario);

  @override
  State<_proprietarioItem> createState() => _proprietarioItemState();
}

class _proprietarioItemState extends State<_proprietarioItem> {
  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(widget.proprietario.nome, style: const TextStyle(fontSize: 24.0,),),
        subtitle: Text(widget.proprietario.cpfCnpj.toString() , style: const TextStyle(fontSize: 16.0,),),
      ),
    );
  }
}
