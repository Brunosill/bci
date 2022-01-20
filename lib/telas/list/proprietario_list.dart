import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:bci/telas/from/pessoajuridica_form.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class ProprietarioList extends StatelessWidget {
  ProprietarioList({Key? key}) : super(key: key);

  final PessoaFisicaDao _dao = PessoaFisicaDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Proprietários'),
      ),
      body: FutureBuilder<List<PessoaFisica>>(
        initialData: const [],
        future: _dao.findAll(),
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
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );


            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.data != null){
                final List<PessoaFisica>? proprietarios = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index){
                    final PessoaFisica proprietario = proprietarios![index];
                    return _proprietarioItem(proprietario);
                  },
                  itemCount: proprietarios!.length,
                );
              }
              break;
          }

          return const Text('Erro desconhecido');

        },
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => const PessoaJuridicaForm(),
            ),
            );
          },
          child: const Icon(Icons.add),
        ),
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
