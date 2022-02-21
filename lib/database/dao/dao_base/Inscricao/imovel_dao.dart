import 'package:bci/modelos/imovel.dart';

class ImovelDao{
  static const String tableImovel = 'CREATE TABLE $_tableImovel('
      '$_inscricao TEXT PRIMARY KEY,'
      '$_tipoImovel TEXT,'
      '$_patrimonioTerreno TEXT,'
      '$_coleta TEXT,'
      '$_insecao TEXT,'
      '$_usoSolo TEXT,'
      '$_elevacao TEXT,'
      '$_coberto TEXT,'
      '$_piso TEXT,'
      '$_estadoConserv TEXT,'
      '$_padrao TEXT,'
      '$_pedologia TEXT,'
      '$_especie TEXT,'
      '$_topografia TEXT,'
      '$_patrimonioConstrucao TEXT,'
      '$_servicosUrbanos TEXT,'
      '$_areaTerreno REAl,'
      '$_profundidade REAL,'
      '$_nUnidade INTEGER,'
      '$_nFrente INTEGER,'
      '$_areaConstruida REAL,'
      '$_testadaAreal REAL,'
      '$_testadaFicticia REAL,'
      '$_lateralEsquerda REAL,'
      '$_lateralDireita REAL,'
      '$_fundos REAL';


  static const String _tableImovel = 'Imovel';
  static const String _inscricao = 'inscricao';
  static const String _tipoImovel = 'tipo_imovel';
  static const String _patrimonioTerreno = 'patrimonio_terreno';
  static const String _coleta = 'coleta';
  static const String _insecao = 'insecao';
  static const String _usoSolo = 'uso_solo';
  static const String _elevacao = 'elevacao';
  static const String _coberto = 'coberto';
  static const String _piso = 'piso';
  static const String _estadoConserv = 'estado_conserv';
  static const String _padrao = 'padrao';
  static const String _pedologia = 'pedologia';
  static const String _especie = 'especie';
  static const String _topografia = 'topografia';
  static const String _patrimonioConstrucao = 'patrimonio_construcao';
  static const String _servicosUrbanos = 'servicos_urbanos';
  static const String _areaTerreno = 'area_terreno';
  static const String _profundidade = 'profundidade';
  static const String _nUnidade = 'n_unidade';
  static const String _nFrente = 'n_frente';
  static const String _areaConstruida = 'area_Construida';
  static const String _testadaAreal = 'testada_areal';
  static const String _testadaFicticia = 'testada_ficticia';
  static const String _lateralEsquerda = 'lateral_esquerda';
  static const String _lateralDireita = 'lateral_direita';
  static const String _fundos = 'fundos';

  Future<int> save(Imovel imovel) async{
    final Database db = awiat  getDatabase();
    Map<String, dynamic> imovelMap = _toMap(imovel);
    return db.insert(_tableImovel, imovelMap);
  }
  Map<String, dynamic> _toMap(Imovel imovel){
    final Map<String, dynamic> imovelMap = {};
    imovelMap[_inscricao] = imovel.inscricao;
    imovelMap[_tipoImovel] = imovel.tipoImovel;
    imovelMap[_patrimonioTerreno] = imovel.patrimonioTerreno;
    imovelMap[_coleta] = imovel.coleta;
    imovelMap[_insecao] = imovel.insecao;
    imovelMap[_usoSolo] = imovel.usoSolo;
    imovelMap[]
  }
}