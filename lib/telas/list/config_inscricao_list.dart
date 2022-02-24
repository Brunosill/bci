import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/dao/configuracao/config_Inscricao_dao.dart';
import '../../modelos/conficuracao/config_inscricao.dart';

class ConfigInscricaoList extends StatefulWidget{
  @override
  State<ConfigInscricaoList> createState() => _ConfigInscricaoListState();
}

class _ConfigInscricaoListState extends State<ConfigInscricaoList> {

  final TextEditingController _distritoController = TextEditingController();
  final TextEditingController _nomeDistritoController = TextEditingController();
  final TextEditingController _estadoDistritoController = TextEditingController();
  final TextEditingController _cepDistritoController = TextEditingController();
  final TextEditingController _setorController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              FutureBuilder<List<ConfigInscricao>>(
                initialData: [],
                future: Provider.of<ConfigInscricaoDao>(context, listen: false).findAll(),
                builder: (context, snapshot){
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
                      if(snapshot.data != null){
                        final List<ConfigInscricao>? configuracoesInscricao = snapshot.data;
                        return ListView.builder(
                          itemBuilder: (context, index){
                            final ConfigInscricao configInscricao = configuracoesInscricao![index];
                            return _Items(configInscricao);
                          }
                        );
                      }
                  }
                return const Text('Erro Desconhecido');
                }
              ),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Adicionar configuraçao'),
            content: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                        labelText: 'Nome do Distrito'
                    ),
                    controller: _nomeDistritoController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: 'Nome do Distrito'
                    ),
                    controller: _distritoController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: 'Nome do Distrito'
                    ),
                    controller: _estadoDistritoController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: 'Nome do Distrito'
                    ),
                    controller: _cepDistritoController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: 'Nome do Distrito'
                    ),
                    controller: _setorController,
                  ),
                ]
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel')
              ),
              TextButton(
                onPressed:(){
                  setState(){
                    _salvaConfiguracao(context);
                  };
                },
                child: Text('Salva'),
              )

            ]
          )
        )

        /*onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ConfigInscricaoFrom(),
              )
            ).then((value){
              setState((){
                widget.createState();
              });
            });
        },*/
      )
    );
  }

  void _salvaConfiguracao(BuildContext context){
    final int distrito = int.parse(_distritoController.text);
    final String nomeDistrito = _nomeDistritoController.text;
    final String estadoDistrito = _estadoDistritoController.text;
    final int cepDistrito = int.parse(_cepDistritoController.text);
    final String setor = _setorController.text;
    final ConfigInscricao novaConfigInscricao = ConfigInscricao(
      distrito,
      nomeDistrito,
      estadoDistrito,
      cepDistrito,
      setor);
    Provider.of<ConfigInscricaoDao>(context, listen: false)
      .save(novaConfigInscricao)
        .then((distrito) => Navigator.pop(context));
  }
}

class _Items extends StatefulWidget{
  final ConfigInscricao configInscricao;
  const _Items(this.configInscricao);

  @override
  State<_Items> createState() => _ItemsState();
}

class _ItemsState extends State<_Items> {
  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        leading: Icon(Icons.construction_outlined),
        title: Text(widget.configInscricao.nomeDistrito),
        subtitle: Text("Distrito: "+ widget.configInscricao.distrito.toString()),
        trailing: Icon(Icons.wrap_text)
      )
    );
  }
}