class baseSetor{
  final int id;
  final int setor;
  final int distrito;
  final String nomeDistrito;
  final int cepDistrito;
  final String estadoDistrito;

  baseSetor(
      this.id,
      this.setor,
      this.distrito,
      this.nomeDistrito,
      this.cepDistrito,
      this.estadoDistrito
      );

  @override
  String toString() {
    return 'Dados do distrito{id setor:$id, Setor: $setor , Distrito: $distrito,'
        'Nome do Distrito: $nomeDistrito, Cep Distrito: $cepDistrito, Estado Distrito: $estadoDistrito';
  }

}