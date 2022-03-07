import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/dao/dao_base/pessoas/pessoajuridica_dao.dart';
import '../../modelos/base_modelo/pessoas/pessoajuridica.dart';
import '../from/pessoa_juridica_form.dart';

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
            Expanded(
              child: FutureBuilder<List<PessoaJuridica>>(
                initialData: [],
                future: Provider.of<PessoaJuridicaDao>(context).findAll(),
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            CircularProgressIndicator.adaptive(),
                            Text('Carregando'),
                          ]
                        )
                      );
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final List<PessoaJuridica>? pessoasJuridicas = snapshot.data;
                      return ListView.builder(
                        itemBuilder: (context, index){
                          final PessoaJuridica pessoaJuridica = pessoasJuridicas![index];
                          return _Item(pessoaJuridica);
                        },
                        itemCount: pessoasJuridicas!.length,
                      );
                  }
                  return const Text("Erro Desconnhecido");
                }
              ),
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PessoaJuridicaForm())).then((value) => setState((){}));
        },
        child: const Icon(Icons.add_outlined),
      )
    );
  }

}

class _Item extends StatefulWidget{

  final PessoaJuridica pessoaJuridica;
  const _Item(this.pessoaJuridica);

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item>{
  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(widget.pessoaJuridica.cpfCnpj, style: const TextStyle(fontSize: 16.0)),
        subtitle: Text(widget.pessoaJuridica.nomeFantasia, style: const TextStyle(fontSize: 16.8))
      )
    );
  }
}