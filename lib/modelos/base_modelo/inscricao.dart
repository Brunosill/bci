class Inscricao{
  final String nInscricao;
  final int distrito;
  final int setor;
  final int qualdra;
  final int lote;
  final int subLote;
  final String situacao;
  final String proprietarioTerreno;
  final String proprietarioConstrucao;

  Inscricao(
      this.nInscricao,
      this.distrito,
      this.setor,
      this.qualdra,
      this.lote,
      this.subLote,
      this.situacao,
      this.proprietarioTerreno,
      this.proprietarioConstrucao,
  );

  @override
  String toString() {
    return 'Inscrição{Inscrição: $nInscricao, distrito: $distrito, setor: $setor, qualdra: $qualdra, lote: $lote, subLote: $subLote,'
    'situação: $situacao, Proprietario Terreno: $proprietarioTerreno, Proprietario Construçao: $proprietarioConstrucao';
  }
}