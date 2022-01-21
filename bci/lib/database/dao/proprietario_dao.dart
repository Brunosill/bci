
import 'package:bci/database/dados/app_database.dart';
import 'package:bci/modelos/proprietario.dart';
import 'package:sqflite/sqflite.dart';

class ProprietarioDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
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


  static const String _tableName = 'proprietarios';
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




  Future<int> save(Proprietario proprietario) async{
    final Database db = await getDatabase();
    Map<String, dynamic> proprietarioMap = _toMap(proprietario);
    return db.insert(_tableName, proprietarioMap);
  }

  Map<String, dynamic> _toMap(Proprietario proprietario) {
    final Map<String, dynamic> proprietarioMap = {};
    proprietarioMap[_cpfcnpj] = proprietario.cpfCnpj;
    proprietarioMap[_nomeProprietario] = proprietario.nomeProprietario;
    proprietarioMap[_codLograd] = proprietario.codLograd;
    proprietarioMap[_lograd] = proprietario.lograd;
    proprietarioMap[_numero] = proprietario.numero;
    proprietarioMap[_aptoScv] = proprietario.aptoScv;
    proprietarioMap[_bairro] = proprietario.bairro;
    proprietarioMap[_cidade] = proprietario.cidade;
    proprietarioMap[_uf] = proprietario.uf;
    proprietarioMap[_cep] = proprietario.cep;
    return proprietarioMap;
  }

  Future<List<Proprietario>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Proprietario> proprietarios = _toList(result);
    return proprietarios;
  }

  List<Proprietario> _toList(List<Map<String, dynamic>> result) {
    final List<Proprietario> proprietarios = [];
    for (Map<String, dynamic> row in result){
      final Proprietario proprietario = Proprietario(
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
      proprietarios.add(proprietario);
    }
    return proprietarios;
  }

}



