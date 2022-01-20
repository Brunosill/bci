import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PessoaFisicaForm extends StatefulWidget {
  const PessoaFisicaForm({Key? key}) : super(key: key);

  @override
  State<PessoaFisicaForm> createState() => _PessoaFisicaFormState();
}

class _PessoaFisicaFormState extends State<PessoaFisicaForm> {

  final TextEditingController _nomeProprietarioController = TextEditingController();
  final TextEditingController _cpfCnpjController = TextEditingController();
  final TextEditingController _codLogradController = TextEditingController();
  final TextEditingController _logradController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _aptoScvController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  final PessoaFisicaDao _dao = PessoaFisicaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro de Proprietario'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                //cpf
                TextField(
                  controller: _cpfCnpjController,
                  decoration: const InputDecoration(
                    labelText: 'CPF/CNPJ',
                  ),
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _nomeProprietarioController,
                    decoration: const InputDecoration(
                      labelText: 'Nome completo',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _codLogradController,
                    decoration: const InputDecoration(
                      labelText: 'cod. Lograd',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _logradController,
                    decoration: const InputDecoration(
                      labelText: 'Logradouro',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _numeroController,
                    decoration: const InputDecoration(
                      labelText: 'Número',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _aptoScvController,
                    decoration: const InputDecoration(
                      labelText: 'Apto S.Cv',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _bairroController,
                    decoration: const InputDecoration(
                      labelText: 'Bairro',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _cidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _ufController,
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _cepController,
                    decoration: const InputDecoration(
                      labelText: 'CEP',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      child: const Text('Salvar'),
                      onPressed: () {
                        return _salvaProprietario(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
  void _salvaProprietario(BuildContext context){
    final String nomeDoProprietario = _nomeProprietarioController.text;
    final int cpfCnpj = int.parse(_cpfCnpjController.text);
    final int codLograd =    int.parse(_codLogradController.text);
    final String lograd = _logradController.text;
    final int numero = int.parse(_numeroController.text);
    final int aptoScv = int.parse(_aptoScvController.text);
    final String bairro = _bairroController.text;
    final String cidade = _cidadeController.text;
    final String uf = _ufController.text;
    final int cep = int.parse(_cepController.text);
    final PessoaFisica novoProprietario = PessoaFisica(
        nomeDoProprietario,
        cpfCnpj,
        codLograd,
        lograd,
        numero,
        aptoScv,
        bairro,
        cidade,
        uf,
        cep);
    _dao.save(novoProprietario).then((cpfCnpj) => Navigator.pop(context));
  }
}

/*
class _campoItem extends StatelessWidget{


  final String name;

  _campoItem(TextEditingController compoControle, this.name  );

  @override
  Widget build(BuildContext context){
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        child: TextField(
          decoration: InputDecoration(

            labelText: this.name,
          ),
        ),
      ),
    );
  }
}*/