import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:bci/telas/from/pessoafisica_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CorpoListPF extends StatefulWidget{

  @override
  State<CorpoListPF> createState() => _CorpoListPFState();

}

class _CorpoListPFState extends State<CorpoListPF>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PessoaFisica>>(
        initialData: [],
        future: Provider.of<PessoaFisicaDao>(context, listen: false).findAll(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ]
                )
              );
            case ConnectionState.active:
              break;

            case ConnectionState.done:
              if(snapshot.data != null){
                final List<PessoaFisica>? pessoas = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index){
                    final PessoaFisica pessoa = pessoas![index];
                    return _pessoaFisicaItem(pessoa);
                  }
                );
              }
              break;
          }
        return const Text('Erro Desconhecido');
        }
      ),/*
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const PessoaFisicaForm(),
            )
          ).then((value){
            setState((){
              widget.createState();
            });
          });
        },
      )
*/
    );
  }
}

class _pessoaFisicaItem extends StatefulWidget{

  final PessoaFisica pessoa ;
  const _pessoaFisicaItem(this.pessoa);

  @override
  State<_pessoaFisicaItem> createState() => _pessoaFisicaItemState();
}

class _pessoaFisicaItemState extends State<_pessoaFisicaItem>{

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(widget.pessoa.nome, style: const TextStyle(fontSize: 24),),
        subtitle: Text(widget.pessoa.cpfCnpj.toString(), style: const TextStyle(fontSize: 16.0))
      )
    );
  }
}