import 'package:bci/database/dados/configuracao_database.dart';
import 'package:bci/modelos/conficuracao/config_inscricao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class ConfigInscricaoDao with ChangeNotifier{
  static const String ConfigSql = 'CREATE TABLE $_tableConfig('
      '$_distrito INTEGER PRIMARY KEY, '
      '$_nomeDistrito TEXT, '
      '$_estadoDistrito TEXT, '
      '$_cepDistrito INTEGER,'
      '$_setor TEXT)';

  static const String _tableConfig = 'config_inscricao';
  static const String _distrito = 'distrito';
  static const String _nomeDistrito = 'nome_distrito';
  static const String _estadoDistrito = 'estado_distrito';
  static const String _cepDistrito = 'cep_distrito';
  static const String _setor = 'setor';

  Future<int> save(ConfigInscricao configInscricao) async{
    final Database db = await getDatabase();
    Map<String, dynamic> configInscricaoMap = _toMap(configInscricao);
    return db.insert(_tableConfig, configInscricaoMap);
  }
  Map<String, dynamic> _toMap(ConfigInscricao configInscricao){
    final Map<String, dynamic> configInscricaoMap = {};
    configInscricaoMap[_distrito] = configInscricao.distrito;
    configInscricaoMap[_nomeDistrito]  = configInscricao.nomeDistrito;
    configInscricaoMap[_estadoDistrito] = configInscricao.estadoDistrito;
    configInscricaoMap[_cepDistrito] = configInscricao.cepDistrito;
    configInscricaoMap[_setor] = configInscricao.setor;
    return configInscricaoMap;
  }

  Future<List<ConfigInscricao>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableConfig);
    List<ConfigInscricao> configuracoesInscricao = _toList(result);
    return configuracoesInscricao;
  }
  List<ConfigInscricao> _toList(List<Map<String, dynamic>> result){
    final List<ConfigInscricao> configuracoesInscricao = [];
    for (Map<String, dynamic> row in result){
      final ConfigInscricao configInscricao = ConfigInscricao(
        row[_distrito],
        row[_nomeDistrito],
        row[_estadoDistrito],
        row[_cepDistrito],
        row[_setor],
      );
      configuracoesInscricao.add(configInscricao);
    }
    return configuracoesInscricao;
  }

  ConfigInscricaoDao(){
    findAll();
  }

}