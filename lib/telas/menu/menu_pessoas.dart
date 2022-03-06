import 'package:bci/modelos/base_modelo/pessoas/pessoafisica.dart';
import 'package:bci/telas/list/proprietario_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPessoas extends StatefulWidget {
  const MenuPessoas({Key? key}) : super(key: key);

  @override
  _MenuPessoasState createState() => _MenuPessoasState();
}

class _MenuPessoasState extends State<MenuPessoas> {
  late int _index =0;
  final List<Widget> _pages = [PessoaFisicaList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value){
          setState((){
            _index = value;
          });
        },
        items: const[
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

