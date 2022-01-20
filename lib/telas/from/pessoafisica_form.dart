import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PessoaFisicaForm extends StatefulWidget {
  const PessoaFisicaForm({Key? key}) : super(key: key);

  @override
  State<PessoaFisicaForm> createState() => _PessoaFisicaFormState();
}

class _PessoaFisicaFormState extends State<PessoaFisicaForm> {
  int _index = 0;

  final _formDados = GlobalKey<FormState>();
  final TextEditingController _nomeProprietarioController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

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
          child: Center(
            child: Stepper(
              currentStep: _index,
              steps: <Step>[
                Step(
                    title: const Text('Dados do Pessoais'),
                    content: Form(
                      key: _formDados,
                      child: Column(
                          children: <Widget>[
                            TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nome Completo',
                                ),
                                style: const TextStyle(
                                    fontSize: 24.0
                                ),
                                controller: _nomeProprietarioController,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.text,
                                validator: (value){
                                  if(value!.length < 3){
                                    return "Informe Nome Completo";
                                  }
                                  if(!value.contains(' ')){
                                    return "Imforme Nome Completo";
                                  }
                                  return null;
                                }
                            ), //Nome Completo
                            TextFormField(
                                controller: _cpfController,
                                decoration: const InputDecoration(
                                    labelText: "CPF"
                                ),
                                style: TextStyle(
                                    fontSize: 24.0
                                ),
                                maxLength: 18,
                                keyboardType: TextInputType.number,
                                inputFormatters:[
                                  FilteringTextInputFormatter.digitsOnly,
                                  CpfOuCnpjFormatter(),
                                ],
                                validator: (value){
                                  if(!CPFValidator.isValid(value)){
                                    return 'Digite Cpf valido';
                                  }
                                  return null;
                                }
                            )
                          ]
                      ),
                    )
                ),
                Step(
                    title: const Text('Endereço'),
                    content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _logradController,
                                decoration: const InputDecoration(
                                  labelText: "Logradouro",
                                ),
                                keyboardType: TextInputType.text,

                              ),

                              Row(
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: TextFormField(
                                          controller: _codLogradController,
                                          decoration: const InputDecoration(
                                              labelText: 'Cód. Lograd.'
                                          ),
                                          style: TextStyle(
                                              fontSize: 18
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly,
                                          ]
                                      )
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                          controller: _numeroController,
                                          decoration: InputDecoration(
                                            labelText: "Número",
                                          ),
                                          style: TextStyle(
                                            fontSize: 20,
                                          )
                                      )
                                  )
                                ],
                              ),

                              Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: TextFormField(
                                        controller:_aptoScvController,
                                        decoration: const InputDecoration(
                                          labelText: 'Apto. S.CV',
                                        ),
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller: _bairroController,
                                          decoration: const InputDecoration(
                                              labelText: "Bairro"
                                          ),
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        )
                                    ),
                                  ]
                              ),

                              TextFormField(
                                  controller: _cidadeController,
                                  decoration: const InputDecoration(
                                    labelText: 'Cidade',
                                  ),
                                  style: const TextStyle(
                                      fontSize: 20
                                  )
                              ),

                              Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: TextFormField(
                                        controller:_ufController,
                                        decoration: const InputDecoration(
                                          labelText: 'UF',
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller: _cepController,
                                          decoration: const InputDecoration(
                                              labelText: "CEP"
                                          ),
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        )
                                    ),
                                  ]
                              ),
                            ]
                        )
                    )
                ),
              ],

              onStepCancel: (){
                if (_index > 0){
                  setState((){
                    _index -= 1;
                  });
                }
              },
              onStepContinue: (){
                if(_index <= 0){
                  if(_formDados.currentState!.validate()){
                    setState(() {
                      _index += 1;
                    });
                  }
                }

                if(_index >= 1){
                  setState(() {
                    _salvaProprietario(context);
                  });
                }
              },
              onStepTapped: (int index){
                setState(() {
                  _index = index;
                });
              },



            ),
          ),
        )

    );
  }


  void _salvaProprietario(BuildContext context){
    final String nomeDoProprietario = _nomeProprietarioController.text;
    final int? cpfCnpj = int.tryParse(UtilBrasilFields.removeCaracteres(_cpfController.text));
    final int? codLograd =    int.tryParse(_codLogradController.text);
    final String lograd = _logradController.text;
    final int? numero = int.tryParse(_numeroController.text);
    final int? aptoScv = int.tryParse(_aptoScvController.text);
    final String bairro = _bairroController.text;
    final String cidade = _cidadeController.text;
    final String uf = _ufController.text;
    final int? cep = int.tryParse(_cepController.text);
    final PessoaFisica novoProprietario = PessoaFisica(
        nomeDoProprietario,
        cpfCnpj!,
        codLograd!,
        lograd,
        numero!,
        aptoScv!,
        bairro,
        cidade,
        uf,
        cep!);
    Provider.of<PessoaFisicaDao>(context, listen: false).save(novoProprietario).then((cpfCnpj) => Navigator.pop(context));
  }
}

/*
SingleChildScrollView(
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
        ),
*/