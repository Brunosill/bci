import 'package:bci/database/dados/incricoes_database.dart';
import 'package:bci/modelos/base_modelo/inscricao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class InscricaoDao with ChangeNotifier{
  static const String tableInscricao = 'CREATE TABLE $_tableInscricao('
      '$_inscricao TEXT PRIMARY KEY,'
      '$_distrito INTERGE,'
      '$_setor INTERGE,'
      '$_qualdra INTERGE, '
      '$_lote INTERGER, '
      '$_subLote INTERGER,'
      '$_situacao TEXT, '
      '$_proprietarioTerreno TEXT, '
      '$_proprietarioConstrucao TEXT) ';


  static const String _tableInscricao = 'inscricoes';
  static const String _inscricao = 'inscricao';
  static const String _distrito = 'distrito';
  static const String _setor = 'setor';
  static const String _qualdra = 'qualdra';
  static const String _lote = 'lote';
  static const String _subLote = 'sub_lote';
  static const String _situacao = 'situacao';
  static const String _proprietarioTerreno = 'proprietario_terreno';
  static const String _proprietarioConstrucao = 'proprietario_construcao';

  Future<int> save(Inscricao inscricao) async {
    final Database db = await getDatabase();
    Map<String, dynamic> inscricaoMap = _toMap(inscricao);
    return db.insert(_tableInscricao, inscricaoMap);
  }
  Map<String, dynamic> _toMap(Inscricao inscricao){
    final Map<String, dynamic> inscricaoMap = {};
    inscricaoMap[_inscricao] = inscricao.nInscricao;
    inscricaoMap[_distrito] = inscricao.distrito;
    inscricaoMap[_setor] = inscricao.setor;
    inscricaoMap[_qualdra] = inscricao.qualdra;
    inscricaoMap[_lote] = inscricao.lote;
    inscricaoMap[_subLote] = inscricao.subLote;
    inscricaoMap[_situacao] = inscricao.situacao;
    inscricaoMap[_proprietarioTerreno] = inscricao.proprietarioTerreno;
    inscricaoMap[_proprietarioConstrucao] = inscricao.proprietarioConstrucao;
    return inscricaoMap;
  }
  
  Future<List<Inscricao>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableInscricao);
    List<Inscricao> inscricoes = _toList(result);
    return inscricoes;
  }
  List<Inscricao> _toList(List<Map<String, dynamic>> result){
    final List<Inscricao> inscricoes = [];
    for (Map<String, dynamic> row in result){
      final Inscricao inscricao = Inscricao(
        row[_inscricao],
        row[_distrito],
        row[_setor],
        row[_qualdra],
        row[_lote],
        row[_subLote],
        row[_situacao],
        row[_proprietarioTerreno],
        row[_proprietarioConstrucao],
      );
      inscricoes.add(inscricao);
    }
    return inscricoes;
  }

  InscricaoDao(){
    findAll();
  }
}