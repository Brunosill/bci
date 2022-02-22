import 'package:bci/database/dao/dao_base/Inscricao/inscricao_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class _ListDeInscricao extends StatelessWidget{
  var _dao = InscricaoDao();

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder<List<Inscricao>>(
            initialData: [],
            future:
          )
        ]
      )
    );
  }
}