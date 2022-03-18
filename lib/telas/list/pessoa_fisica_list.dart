import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../from/pessoa_fisica_form.dart';

class PessoaFisicaList extends StatefulWidget {
  PessoaFisicaList({Key? key}) : super(key: key);

  @override
  State<PessoaFisicaList> createState() => _PessoaFisicaListState();
}

class _PessoaFisicaListState extends State<PessoaFisicaList> {
  TextEditingController _editingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  onChanged: (text){
                  },
                  controller: _editingController,
                  decoration: const InputDecoration(
                    labelText: "Procurar",
                    hintText: "Informe o cpf",
                    prefixIcon: Icon(Icons.search_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    )
                  )
                )
              ),
              Expanded(
                child:FutureBuilder<List<PessoaFisica>>(
                    initialData: [],
                    future: Provider.of<PessoaFisicaDao>(context).findAll(),
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
                                    Text('Carregando'),
                                  ]
                              )
                          );
                        case ConnectionState.active:
                          break;
                        case ConnectionState.done:
                          final List<PessoaFisica>? pessoasFisicas = snapshot.data;
                          return ListView.builder(
                            itemBuilder: (context, index){
                              final PessoaFisica pessoaFisica = pessoasFisicas![index];
                              return _Item(pessoaFisica);
                            },
                            itemCount: pessoasFisicas!.length,
                          );
                      }
                      return const Text('Erro Desconhecido');
                    }
                ),
              ),

            ]
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PessoaFisicaForm())).then((value) => setState((){}));
        },
        child: const Icon(Icons.add_outlined),
      ),
    );

  }
}

class _Item extends StatefulWidget{

  final PessoaFisica pessoaFisica;
  const _Item(this.pessoaFisica);

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {

  final PessoaFisicaDao _dao = PessoaFisicaDao();
  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        onLongPress: (){
         _dao.delete(widget.pessoaFisica.cpfCnpj);
        },
        title: Text(widget.pessoaFisica.nome, style: const TextStyle(fontSize: 24.0,),),
        subtitle: Text(widget.pessoaFisica.cpfCnpj, style: const TextStyle(fontSize: 16.0,),),
      ),
    );
  }
}
