import 'package:bci/database/dao/proprietario_dao.dart';
import 'package:bci/modelos/proprietario.dart';
import 'package:bci/telas/from/proprietario_form.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class ProprietarioList extends StatelessWidget {
  ProprietarioList({Key? key}) : super(key: key);

  final ProprietarioDao _dao = ProprietarioDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Proprietários'),
      ),
      body: FutureBuilder<List<Proprietario>>(
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
                final List<Proprietario>? proprietarios = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index){
                    final Proprietario proprietario = proprietarios![index];
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
                builder: (context) => const ProprietarioForm(),
            ),
            );
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}

class _proprietarioItem extends StatefulWidget{

  final Proprietario proprietario;
  const _proprietarioItem(this.proprietario);

  @override
  State<_proprietarioItem> createState() => _proprietarioItemState();
}

class _proprietarioItemState extends State<_proprietarioItem> {
  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(widget.proprietario.nomeProprietario, style: const TextStyle(fontSize: 24.0,),),
        subtitle: Text(widget.proprietario.cpfCnpj.toString() , style: const TextStyle(fontSize: 16.0,),),
      ),
    );
  }
}
