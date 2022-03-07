import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:bci/telas/from/pessoajuridica_form.dart';
import 'package:bci/telas/list/pessoa_fisica_list.dart';
import 'package:bci/telas/list/pessoa_juridica_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPessoas extends StatefulWidget {
  const MenuPessoas({Key? key}) : super(key: key);

  @override
  _MenuPessoasState createState() => _MenuPessoasState();
}

class _MenuPessoasState extends State<MenuPessoas> {
  late int _index =0;
  static List<Widget> _pages = [PessoaFisicaList(), PessoaJuridicaList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_index)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int value){
          setState((){
            _index = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Pessoa Fisica',
            icon: Icon(Icons.person_outline)
          ),
          BottomNavigationBarItem(
            label: 'Pessao Juridica',
            icon: Icon(Icons.work),
          )
        ]
      )
    );
  }
}

