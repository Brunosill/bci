class ConfigInscricao{
  final int distrito;
  final String nomeDistrito;
  final String estadoDistrito;
  final int cepDistrito;
  final String setor;

  ConfigInscricao(
      this.distrito,
      this.nomeDistrito,
      this.estadoDistrito,
      this.cepDistrito,
      this.setor,
    );

  @override
  String toString() {
    return 'Comfig Inscricao{Distrito: $distrito, Nome Distrito: $nomeDistrito, Estado Distrito: $estadoDistrito'
        'Cep Distrito: $cepDistrito, Setor: $setor';
  }
}