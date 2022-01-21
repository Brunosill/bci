class SetorDao{
  static const String setorSql = "CREATE TABLE $_tableName("
      "$_id INTEGER PRIMERY KEY, "
      "$_setor INTEGER, "
      "$_distrito INTEGER, "
      "$_nomeDistrito TEXT, "
      "$_cepDistrito INTEGER,"
      "$_estadoDistrito TEXT)";

  static const String _id = 'id';
  static const String _tableName = 'setores';
  static const String _setor = 'setor';
  static const String _distrito = 'distrito';
  static const String _nomeDistrito = 'nome_distrito';
  static const String _cepDistrito = 'cep_distrito';
  static const String _estadoDistrito = 'estado_distrito';

}