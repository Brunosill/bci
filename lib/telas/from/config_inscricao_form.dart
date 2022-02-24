

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/dao/configuracao/config_Inscricao_dao.dart';
import '../../modelos/conficuracao/config_inscricao.dart';

class ConfigInscricaoFrom extends StatefulWidget{
  final ConfigInscricaoDao _dao = ConfigInscricaoDao();

  @override
  State<ConfigInscricaoFrom> createState() => _ConfigInscricaoFromState();
}

class _ConfigInscricaoFromState extends State<ConfigInscricaoFrom> {

  final ConfigInscricaoDao _dao = ConfigInscricaoDao();

  final TextEditingController _distritoController = TextEditingController();
  final TextEditingController _nomeDistritoController = TextEditingController();
  final TextEditingController _estadoDistritoController = TextEditingController();
  final TextEditingController _cepDistritoController = TextEditingController();
  final TextEditingController _setorController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return

      Column(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
                labelText: 'Nome do Distrito'
            ),
            controller: _nomeDistritoController,
          ),
          TextField(
            decoration: const InputDecoration(
              isCollapsed: true,
              labelText: 'Numero do distrito',
            ),
            controller: _distritoController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Estado do Distrino',
            ),
            controller: _estadoDistritoController,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: 'Cep do Distrito'
            ),
            controller: _cepDistritoController,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: 'Número de Setores'
            ),
            controller: _setorController,
          ),
          ElevatedButton(
              child: Text('Salva'),
              onPressed: (){
                setState((){
                  _salvaConfiguracao(context);
                });
              }
          )
        ]

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
      setor
    );
    _dao.save(novaConfigInscricao).then((distrito) => Navigator.pop(context));
  }
}