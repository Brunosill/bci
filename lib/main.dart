import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/telas/dashdoard.dart';
import 'package:bci/telas/from/incricao/inscricao_from.dart';
import 'package:bci/web/teste_cep.dart';
import 'package:bci/web/webapi/cep_api.dart';
import 'package:bci/web/webapi/cep_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/dao/configuracao/config_Inscricao_dao.dart';
import 'database/dao/dao_base/Inscricao/imovel_dao.dart';
import 'database/dao/dao_base/Inscricao/inscricao_dao.dart';
import 'database/dao/dao_base/pessoas/pessoajuridica_dao.dart';

void main() {
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConfigInscricaoDao(),
        ),
        ChangeNotifierProvider(
          create: (context) => InscricaoDao(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImovelDao(),
        ),
        ChangeNotifierProvider(
          create: (context) => PessoaJuridicaDao(),
        ),
        ChangeNotifierProvider(
          create: (context) => PessoaFisicaDao(),
        ),

      ], child: BCI(),
    
    )
  );
}

class BCI extends StatelessWidget {
  const BCI({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700],),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent[700],
          textTheme: ButtonTextTheme.primary,
      )),
      home: Dashboard(),
    );
  }
}
