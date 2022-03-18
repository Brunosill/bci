

import 'package:bci/database/dados/pessoa_database.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class PessoaFisicaDao with ChangeNotifier{
  static const String tablePF = 'CREATE TABLE $_tablePF('
      //'$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_cpf TEXT PRIMARY KEY,'
      '$_nome TEXT, '
      '$_codLograd TEXT,'
      '$_lograd TEXT,'
      '$_numero TEXT,'
      '$_aptoScv TEXT,'
      '$_bairro TEXT,'
      '$_cidade TEXT,'
      '$_uf TEXT,'
      '$_cep TEXT)';


  static const String _tablePF = 'nome';
  //static const String _id = 'id';
  static const String _cpf = 'cpf'; //usado com id
  static const String _nome = 'nome';
  static const String _codLograd = 'cod_lograd';
  static const String _lograd = 'lograd';
  static const String _numero = 'numero';
  static const String _aptoScv = 'apto_scv';
  static const String _bairro = 'bairro';
  static const String _cidade = 'cidade';
  static const String _uf = 'uf';
  static const String _cep = 'cep';

  Future<int> save(PessoaFisica pessoaFisica) async{
    final Database db = await getDatabase();
    Map<String, dynamic> pessoaFisicaMap = _toMap(pessoaFisica);
    return db.insert(_tablePF, pessoaFisicaMap);

  }
  Map<String, dynamic> _toMap(PessoaFisica pessoaFisica) {
    final Map<String, dynamic> pessoaFisicaMap = {};
    pessoaFisicaMap[_cpf] = pessoaFisica.cpfCnpj;
    pessoaFisicaMap[_nome] = pessoaFisica.nome;
    pessoaFisicaMap[_codLograd] = pessoaFisica.codLograd;
    pessoaFisicaMap[_lograd] = pessoaFisica.lograd;
    pessoaFisicaMap[_numero] = pessoaFisica.numero;
    pessoaFisicaMap[_aptoScv] = pessoaFisica.aptoScv;
    pessoaFisicaMap[_bairro] = pessoaFisica.bairro;
    pessoaFisicaMap[_cidade] = pessoaFisica.cidade;
    pessoaFisicaMap[_uf] = pessoaFisica.uf;
    pessoaFisicaMap[_cep] = pessoaFisica.cep;
    return pessoaFisicaMap;
  }

  Future<List<PessoaFisica>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablePF);
    List<PessoaFisica> pessoasFisicas = _toList(result);
    return pessoasFisicas;
  }
  List<PessoaFisica> _toList(List<Map<String, dynamic>> result) {
    final List<PessoaFisica> pessoasFisicas = [];
    for (Map<String, dynamic> row in result){
      final PessoaFisica pessoafisica = PessoaFisica(
        row[_nome],
        row[_cpf],
        row[_codLograd],
        row[_lograd],
        row[_numero],
        row[_aptoScv],
        row[_bairro],
        row[_cidade],
        row[_uf],
        row[_cep],
      );
      pessoasFisicas.add(pessoafisica);
    }
    return pessoasFisicas;
  }

  Future<int> delete(String cpf) async{
    final Database db = await getDatabase();
    return db.delete(_tablePF,  where: '$_cpf = ? ', whereArgs: [cpf]);
  }

  PessoaFisicaDao(){
    findAll();
  }

}