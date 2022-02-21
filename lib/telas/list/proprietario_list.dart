import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:flutter/material.dart';


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
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          appBar: AppBar(
            title: Text('Listas'),
            automaticallyImplyLeading: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Pessoa Fisica'),
                Tab(text: 'Pessoa Juridica' )
              ]
            ),

          ),
          body: TabBarView(
            children: <Widget>[
              CorpoListPF(),
              Center(child:Text('vai'))
            ]
          )
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
