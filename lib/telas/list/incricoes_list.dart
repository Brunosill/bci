import 'package:bci/database/dao/dao_base/Inscricao/inscricao_dao.dart';
import 'package:bci/modelos/base_modelo/inscricao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class InscricaoLista extends StatelessWidget{
  final InscricaoDao _dao = InscricaoDao();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Inscricao>>(
              initialData: [],
              future: _dao.findAll(),
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
                      final List<Inscricao>? inscricoes = snapshot.data;
                      return ListView.builder(
                        itemBuilder: (context, index){
                          final Inscricao inscricao =  inscricoes![index];
                          return _inscricaoItem(inscricao);
                        }
                      );
                    }
                }
              return const Text('Erro Desconhecido');
              }
            )
          ]
        ),
      )
    );
  }
}

class _inscricaoItem extends StatefulWidget{
  final Inscricao inscricao;
  const _inscricaoItem(this.inscricao);

  @override
  State<_inscricaoItem> createState() => _inscricaoItemState();
}

class _inscricaoItemState extends State<_inscricaoItem>{

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(widget.inscricao.nInscricao,  ),
        subtitle: Text(widget.inscricao.situacao, ),
      )
    );
  }
}