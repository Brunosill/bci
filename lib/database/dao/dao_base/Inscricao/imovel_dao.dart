import 'package:bci/database/dados/incricoes_database.dart';
import 'package:bci/modelos/base_modelo/imovel.dart';
import 'package:sqflite/sqflite.dart';

class ImovelDao{
  static const String tableImovel = 'CREATE TABLE $_tableImovel('
      '$_inscricao TEXT PRIMARY KEY,'
      '$_tipoImovel TEXT,'
      '$_situacao TEXT, '
      '$_patrimonioTerreno TEXT,'
      '$_coleta TEXT,'
      '$_insecao TEXT,'
      '$_usoSolo TEXT,'
      '$_elevacao TEXT,'
      '$_coberta TEXT,'
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
      '$_nUnidades INTEGER,'
      '$_nFrentes INTEGER,'
      '$_areaConstruida REAL,'
      '$_testadaAreal REAL,'
      '$_testadaFicticia REAL,'
      '$_lateralEsquerda REAL,'
      '$_lateralDireita REAL,'
      '$_fundos REAL)';


  static const String _tableImovel = 'imovel';
  static const String _inscricao = 'inscricao';
  static const String _tipoImovel = 'tipo_imovel';
  static const String _situacao = 'situacao';
  static const String _patrimonioTerreno = 'patrimonio_terreno';
  static const String _coleta = 'coleta';
  static const String _insecao = 'insecao';
  static const String _usoSolo = 'uso_solo';
  static const String _elevacao = 'elevacao';
  static const String _coberta = 'coberto';
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
  static const String _nUnidades = 'n_unidade';
  static const String _nFrentes = 'n_frente';
  static const String _areaConstruida = 'area_Construida';
  static const String _testadaAreal = 'testada_areal';
  static const String _testadaFicticia = 'testada_ficticia';
  static const String _lateralEsquerda = 'lateral_esquerda';
  static const String _lateralDireita = 'lateral_direita';
  static const String _fundos = 'fundos';

  Future<int> save(Imovel imovel) async{
    final Database db = await  getDatabase();
    Map<String, dynamic> imovelMap = _toMap(imovel);
    return db.insert(_tableImovel, imovelMap);
  }
  Map<String, dynamic> _toMap(Imovel imovel){
    final Map<String, dynamic> imovelMap = {};
    imovelMap[_inscricao] = imovel.inscricao;
    imovelMap[_tipoImovel] = imovel.tipoImovel;
    imovelMap[_situacao] = imovel.situacao;
    imovelMap[_patrimonioTerreno] = imovel.patrimonioTerreno;
    imovelMap[_coleta] = imovel.coleta;
    imovelMap[_insecao] = imovel.insecao;
    imovelMap[_usoSolo] = imovel.usoSolo;
    imovelMap[_elevacao] = imovel.elevacao;
    imovelMap[_coberta] = imovel.coberta;
    imovelMap[_piso] = imovel.piso;
    imovelMap[_estadoConserv] = imovel.estadoConserv;
    imovelMap[_padrao] = imovel.padrao;
    imovelMap[_pedologia] = imovel.pedologia;
    imovelMap[_especie] = imovel.especie;
    imovelMap[_topografia] = imovel.topografia;
    imovelMap[_patrimonioConstrucao] = imovel.patrimonioConstrucao;
    imovelMap[_servicosUrbanos] = imovel.servicosUrbanos;
    imovelMap[_areaTerreno] = imovel.areaTerreno;
    imovelMap[_profundidade] = imovel.profundidade;
    imovelMap[_nUnidades] = imovel.nUnidades;
    imovelMap[_nFrentes] = imovel.nFrentes;
    imovelMap[_areaConstruida] = imovel.areaConstruida;
    imovelMap[_testadaAreal]= imovel.testadaAreal;
    imovelMap[_testadaFicticia] = imovel.testadaFicticia;
    imovelMap[_lateralEsquerda] = imovel.lateralEsquerda;
    imovelMap[_lateralDireita]  = imovel.lateralDireita;
    imovelMap[_fundos] = imovel.fundos;
    return imovelMap;
  }

  Future<List<Imovel>> findAll() async{
    final Database db = await  getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableImovel);
    List<Imovel> imoveis = _toList(result);
    return imoveis;
  }
  List<Imovel>  _toList(List<Map<String, dynamic>> result){
    final List<Imovel> imoveis = [];
    for (Map<String, dynamic> row in result){
      final Imovel imovel = Imovel(
        row[_inscricao],
        row[_tipoImovel],
        row[_situacao],
        row[_patrimonioTerreno],
        row[_coleta],
        row[_insecao],
        row[_usoSolo],
        row[_elevacao],
        row[_coberta],
        row[_piso],
        row[_estadoConserv],
        row[_padrao],
        row[_pedologia],
        row[_especie],
        row[_topografia],
        row[_patrimonioConstrucao],
        row[_servicosUrbanos],
        row[_areaTerreno],
        row[_profundidade],
        row[_nUnidades],
        row[_nFrentes],
        row[_areaConstruida],
        row[_testadaAreal],
        row[_testadaFicticia],
        row[_lateralEsquerda],
        row[_lateralDireita],
        row[_fundos],
      );
      imoveis.add(imovel);
    }
    return imoveis;
  }
}