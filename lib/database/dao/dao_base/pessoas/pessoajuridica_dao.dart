
import 'package:bci/modelos/base_modelo/pessoas/pessoajuridica.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../../../dados/pessoa_database.dart';

class PessoaJuridicaDao extends ChangeNotifier{
  static const String pessoaJuridica = "CREATE TABLE $_pessoaJuridica("
      //"$_id INTEGER PRIMERY KEY AUTOINCREMENT,"
      "$_cpfCnpj TEXT PRIMERY KEY,"
      "$_razaoSocial TEXT,"
      "$_inscriCnpj TEXT,"
      "$_inscriEstadual TEXT,"
      "$_inscriMunicipal TEXT,"
      "$_cnae TEXT,"
      "$_nomeFantasia TEXT,"
      "$_regime TEXT,"
      "$_atividade TEXT,"
      "$_alvara TEXT,"
      "$_icms TEXT,"
      "$_iss TEXT,"
      "$_vlgSanitaria TEXT,"
      "$_mEmpresa TEXT,"
      "$_emiteNFiscal TEXT)";

  //static const String _id = 'id';
  static const String _cpfCnpj = 'cpf_cnpj';
  static const String _pessoaJuridica = 'pessoa_juridica';
  static const String _razaoSocial = 'razao_social';
  static const String _inscriCnpj = 'inscricao_cnpj';
  static const String _inscriEstadual = 'inscricao_estadual';
  static const String _inscriMunicipal = 'inscricao_numicipal';
  static const String _cnae = 'cnae';
  static const String _nomeFantasia = 'nome_fantasia';
  static const String _regime = 'regime';
  static const String _atividade = 'atividade';
  static const String _alvara = 'alvara';
  static const String _icms = 'icms';
  static const String _iss = 'iss';
  static const String _vlgSanitaria = 'vlg_sanitaria';
  static const String _mEmpresa = 'm_empresa';
  static const String _emiteNFiscal = 'emite_n_iscal';

  Future<int> save(PessoaJuridica empresarial) async {
    final Database db = await getDatabase();
    Map<String, dynamic> empresarialMap = _toMap(empresarial);
    return db.insert(_pessoaJuridica, empresarialMap);
  }

  Map<String, dynamic> _toMap(PessoaJuridica pessoaJuridica) {
    final Map<String, dynamic> pessoaJuridicaMap = {};
    //pessoaJuridicaMap[_id] = pessoaJuridica.id;
    pessoaJuridicaMap[_razaoSocial] = pessoaJuridica.razaoSocial;
    pessoaJuridicaMap[_cpfCnpj] = pessoaJuridica.cpfCnpj;
    pessoaJuridicaMap[_inscriCnpj] = pessoaJuridica.inscriCnpj;
    pessoaJuridicaMap[_inscriEstadual] = pessoaJuridica.inscriEstadual;
    pessoaJuridicaMap[_inscriMunicipal] = pessoaJuridica.inscriMunicipal;
    pessoaJuridicaMap[_cnae] = pessoaJuridica.cnae;
    pessoaJuridicaMap[_nomeFantasia] = pessoaJuridica.nomeFantasia;
    pessoaJuridicaMap[_regime] = pessoaJuridica.regime;
    pessoaJuridicaMap[_atividade] = pessoaJuridica.atividade;
    pessoaJuridicaMap[_alvara] = pessoaJuridica.alvara;
    pessoaJuridicaMap[_icms] = pessoaJuridica.icms;
    pessoaJuridicaMap[_iss] = pessoaJuridica.iss;
    pessoaJuridicaMap[_vlgSanitaria] = pessoaJuridica.vlgSanitaria;
    pessoaJuridicaMap[_mEmpresa] = pessoaJuridica.mEmpresa;
    pessoaJuridicaMap[_emiteNFiscal] = pessoaJuridica.emiteNFiscal;
    return pessoaJuridicaMap;
  }

  Future<List<PessoaJuridica>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_pessoaJuridica);
    List<PessoaJuridica> pessoasJuridicas = _toList(result);
    return pessoasJuridicas;
  }


  List<PessoaJuridica> _toList(List<Map<String, dynamic>> result) {
    final List<PessoaJuridica> pessasJuridicas = [];
    for (Map<String, dynamic> row in result) {
      final PessoaJuridica pessoaJuridica = PessoaJuridica(
        //row[_id],
        row[_cpfCnpj],
        row[_razaoSocial],
        row[_inscriCnpj],
        row[_inscriEstadual],
        row[_inscriMunicipal],
        row[_cnae],
        row[_nomeFantasia],
        row[_regime],
        row[_atividade],
        row[_alvara],
        row[_icms],
        row[_iss],
        row[_vlgSanitaria],
        row[_mEmpresa],
        row[_emiteNFiscal],
      );
      pessasJuridicas.add(pessoaJuridica);
    }
    return pessasJuridicas;
  }
}
