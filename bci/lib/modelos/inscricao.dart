class Inscricao{
  final int inscricao;
  final int distrito;
  final int setor;
  final int qualdra;
  final int lote;
  final int subLote;
  final String situacao;

  Inscricao(
      this.inscricao,
      this.distrito,
      this.setor,
      this.qualdra,
      this.lote,
      this.subLote,
      this.situacao
  );

  @override
  String toString() {
    return 'Inscrição{Inscrição: $inscricao, distrito: $distrito, setor: $setor, qualdra: $qualdra, lote: $lote, subLote: $subLote, situação: $situacao';
  }
}