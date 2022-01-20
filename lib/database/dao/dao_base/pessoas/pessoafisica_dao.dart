
import 'package:bci/database/dados/pessoa_database.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class PessoaFisicaDao extends ChangeNotifier {
  static const String pessoaFisica = 'CREATE TABLE $_pessoafisica('
      '$_cpfcnpj INTEGER PRIMARY KEY, ' //usado com id
      '$_nomeProprietario TEXT, '
      '$_codLograd INTEGER,'
      '$_lograd TEXT,'
      '$_numero INTEGER,'
      '$_aptoScv INTEGER,'
      '$_bairro TEXT,'
      '$_cidade TEXT,'
      '$_uf TEXT,'
      '$_cep INTEGER )';


  static const String _pessoafisica = 'nome';
  static const String _cpfcnpj = 'cpf_cnpj'; //usado com id
  static const String _nomeProprietario = 'nome_proprietario';
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
    return db.insert(_pessoafisica, pessoaFisicaMap);
  }

  Map<String, dynamic> _toMap(PessoaFisica pessoaFisica) {
    final Map<String, dynamic> pessoaFisicaMap = {};
    pessoaFisicaMap[_cpfcnpj] = pessoaFisica.cpfCnpj;
    pessoaFisicaMap[_nomeProprietario] = pessoaFisica.nome;
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
    final List<Map<String, dynamic>> result = await db.query(_pessoafisica);
    List<PessoaFisica> pessoasFisicas = _toList(result);
    return pessoasFisicas;
  }

  List<PessoaFisica> _toList(List<Map<String, dynamic>> result) {
    final List<PessoaFisica> pessoasFisicas = [];
    for (Map<String, dynamic> row in result){
      final PessoaFisica pessoaFisica = PessoaFisica(
        row[_nomeProprietario],
        row[_cpfcnpj],
        row[_codLograd],
        row[_lograd],
        row[_numero],
        row[_aptoScv],
        row[_bairro],
        row[_cidade],
        row[_uf],
        row[_cep],
      );
      pessoasFisicas.add(pessoaFisica);
    }
    return pessoasFisicas;
  }

}



