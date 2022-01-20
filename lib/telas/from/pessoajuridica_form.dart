import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PessoaJuridicaForm extends StatefulWidget {
  const PessoaJuridicaForm({Key? key}) : super(key: key);

  @override
  State<PessoaJuridicaForm> createState() => _PessoaJuridicaFormState();
}

class _PessoaJuridicaFormState extends State<PessoaJuridicaForm> {

  final _formKey = GlobalKey<FormState>();

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
        appBar: AppBar(title: const Text('Cadastro de Proprietário'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
//cpf
                  TextFormField(
                    controller: _cpfCnpjController,
                    decoration: const InputDecoration(
                      labelText: 'CPF/CNPJ',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 18,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfOuCnpjFormatter(),
                    ],
                  ),


                  TextFormField(
                    controller: _nomeProprietarioController,
                    keyboardType: TextInputType.text,
                    maxLength: 255,
                    decoration: const InputDecoration(
                      labelText: 'Nome completo',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

//lograd
                  TextFormField(
                    controller: _codLogradController,
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    decoration: const InputDecoration(
                      labelText: 'cod. Lograd',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

                  TextFormField(
                    controller: _logradController,
                    keyboardType: TextInputType.text,
                    maxLength: 255,
                    decoration: const InputDecoration(
                      labelText: 'Logradouro',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

                  TextFormField(
                    controller: _numeroController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      labelText: 'Número',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

//apto
                  TextFormField(
                    controller: _aptoScvController,
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    decoration: const InputDecoration(
                      labelText: 'Apto S.Cv',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

//bairro
                  TextFormField(
                    controller: _bairroController,
                    keyboardType: TextInputType.text,
                    maxLength: 255,
                    decoration: const InputDecoration(
                      labelText: 'Bairro',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

//cidade
                  TextFormField(
                    controller: _cidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

//uf
                  TextFormField(
                    controller: _ufController,
                    keyboardType: TextInputType.text,
                    maxLength: 2,
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),

//cep
                  TextFormField(
                    controller: _cepController,
                    keyboardType: TextInputType.number,
                    maxLength: 9,
                    decoration: const InputDecoration(
                      labelText: 'CEP',
                    ),
                    style: const TextStyle(
                      fontSize: 24.0,
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
          ),
        )

    );
  }
  void _salvaProprietario(BuildContext context){
    final String nomeDoProprietario = _nomeProprietarioController.text;
    final int cpfCnpj = int.parse(UtilBrasilFields.removeCaracteres(_cpfCnpjController.text));
    final int codLograd =    int.parse(_codLogradController.text);
    final String lograd = _logradController.text;
    final int numero = int.parse(_numeroController.text);
    final int aptoScv = int.parse(_aptoScvController.text);
    final String bairro = _bairroController.text;
    final String cidade = _cidadeController.text;
    final String uf = _ufController.text;
    final int cep = int.parse(UtilBrasilFields.removeCaracteres(_cepController.text));
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
