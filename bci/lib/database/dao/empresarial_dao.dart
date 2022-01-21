
import 'package:bci/modelos/empresarial.dart';
import 'package:sqflite/sqflite.dart';

import '../dados/app_database.dart';

class EmpresarialDao {
  static const String empresarialSql = "CREATE TABLE $_tableName("
      "$_cpfCnpj INTEGER PRIMERY KEY,"
      "$_razaoSocial TEXT,"
      "$_inscriCnpj INTEGER,"
      "$_inscriEstadual INTEGER,"
      "$_inscriMunicipal INTEGER,"
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

  static const String _cpfCnpj = 'cpf_cnpj';
  static const String _tableName = 'empresarial';
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

  Future<int> save(Empresarial empresarial) async {
    final Database db = await getDatabase();
    Map<String, dynamic> empresarialMap = _toMap(empresarial);
    return db.insert(_tableName, empresarialMap);
  }

  Map<String, dynamic> _toMap(Empresarial empresarial) {
    final Map<String, dynamic> empresarialMap = {};
    empresarialMap[_razaoSocial] = empresarial.razaoSocial;
    empresarialMap[_cpfCnpj] = empresarial.cpfCnpj;
    empresarialMap[_inscriCnpj] = empresarial.inscriCnpj;
    empresarialMap[_inscriEstadual] = empresarial.inscriEstadual;
    empresarialMap[_inscriMunicipal] = empresarial.inscriMunicipal;
    empresarialMap[_cnae] = empresarial.cnae;
    empresarialMap[_nomeFantasia] = empresarial.nomeFantasia;
    empresarialMap[_regime] = empresarial.regime;
    empresarialMap[_atividade] = empresarial.atividade;
    empresarialMap[_alvara] = empresarial.alvara;
    empresarialMap[_icms] = empresarial.icms;
    empresarialMap[_iss] = empresarial.iss;
    empresarialMap[_vlgSanitaria] = empresarial.vlgSanitaria;
    empresarialMap[_mEmpresa] = empresarial.mEmpresa;
    empresarialMap[_emiteNFiscal] = empresarial.emiteNFiscal;
    return empresarialMap;
  }

  Future<List<Empresarial>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Empresarial> empresariais = _toList(result);
    return empresariais;
  }


  List<Empresarial> _toList(List<Map<String, dynamic>> result) {
    final List<Empresarial> empresariais = [];
    for (Map<String, dynamic> row in result) {
      final Empresarial empresarial = Empresarial(
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
      empresariais.add(empresarial);
    }
    return empresariais;
  }
}
