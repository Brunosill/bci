class PessoaJuridica {
  final String razaoSocial;
  final int cpfCnpj;
  final int inscriCnpj;
  final int inscriEstadual;
  final int inscriMunicipal;
  final int cnae;
  final String nomeFantasia;
  final String regime; //pessoal fisica, pessoal juridica, sociedade civel
  final String atividade;
  final bool alvara;
  final bool icms;
  final bool iss;
  final bool vlgSanitaria;
  final bool mEmpresa;
  final bool emiteNFiscal;

  PessoaJuridica(
      this.cpfCnpj,
    this.razaoSocial,
      this.inscriCnpj,
    this.inscriEstadual,
    this.inscriMunicipal,
    this.cnae,
    this.nomeFantasia,
    this.regime,
    this.atividade,
    this.alvara,
    this.icms,
    this.iss,
    this.vlgSanitaria,
    this.mEmpresa,
    this.emiteNFiscal);

  @override
  String toString() {
    return 'Pessoa Juridica{ cpf/cnpj: $cpfCnpj, Razão Social: $razaoSocial, Inscrição cnpj; $inscriCnpj, Inscrição Estadual: $inscriEstadual, Inscrição Municipal: $inscriMunicipal, CNAE: $cnae, Nome Fantasia: $nomeFantasia, Regime: $regime, Atividade: $atividade, icms: $icms, iss: $iss, VlgSanitaria: $vlgSanitaria, NEmpresa: $mEmpresa, EmiteNFiscal: $emiteNFiscal}';
  }
}
