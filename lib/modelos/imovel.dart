class Imovel {
  final int inscricao;
  final String tipoImovel;
  final String situacao;
  final String patrimonioTerreno;
  final String coleta;
  final String insecao;
  final String usoSolo;
  final String elevacao;
  final String coberta;
  final String piso;
  final String estadoConserv;
  final String padrao;
  final String pedologia;
  final String especie;
  final String topografia;
  final String patrimonioConstrucao;
  final String servicosUrbanos;
  final double areaTerreno;
  final double profundidade;
  final int nUnidade;
  final int nFrentes;
  final double areaConstruida;
  final double testadaAreal;
  final double testadaFicticia;
  final double lateralEsquerda;
  final double lateralDireita;
  final double fundos;
  
  Imovel(
      this.inscricao,
      this.tipoImovel,
      this.situacao,
      this.patrimonioTerreno,
      this.coleta,
      this.insecao,
      this.usoSolo,
      this.elevacao,
      this.coberta,
      this.piso,
      this.estadoConserv,
      this.padrao,
      this.pedologia,
      this.especie,
      this.topografia,
      this.patrimonioConstrucao,
      this.servicosUrbanos,
      this.areaTerreno,
      this.profundidade,
      this.nUnidade,
      this.nFrentes,
      this.areaConstruida,
      this.testadaAreal,
      this.testadaFicticia,
      this.lateralEsquerda,
      this.lateralDireita,
      this.fundos,
      );
  @override
  String toString(){
    return 'Imovel{ Inscrição: $inscricao, Tipo de Imovel: $tipoImovel, Situação: $situacao, Patrimonio Terrono: $patrimonioTerreno,'
        'Coleta: $coleta, Inseção: $insecao, Uso do Solo: $usoSolo, Elevação: $elevacao, Coberta: $coberta,'
        'Piso: $piso, Estado de Converçao:$estadoConserv, Padrão: $padrao, Pedologia: $pedologia, Especie: $especie,'
        'Topografia: $topografia, Patrimonio Construção: $patrimonioConstrucao, Servicos Urbanos: $servicosUrbanos,'
        'Area Terreno: $areaTerreno, Profundidade: $profundidade, N. Unidade: $nUnidade, N. Frentes: $nFrentes,'
        'Area Construida: $areaConstruida, Testa Areal: $testadaAreal, Testa Ficticia: $testadaFicticia,'
        'Lateral Esquerda: $lateralEsquerda, Lateral Direita: $lateralDireita, Fundos: $fundos';
  }
  
}