import 'package:bci/telas/list/incricoes_list.dart';
import 'package:flutter/material.dart';

class MenuInscricao extends StatefulWidget{
  @override
  State<MenuInscricao> createState() => _MenuInscricaoState();
}

class _MenuInscricaoState extends State<MenuInscricao> {
  late int _index = 0;
  final List<Widget> _pages = [InscricaoLista(), ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value){
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Inscrição',
            icon: Icon(Icons.home_work_outlined)
          ),
          BottomNavigationBarItem(
            label: 'Nova Inscrição' ,
            icon: Icon(Icons.add_box_outlined)
          )
        ]
      )
    );
  }
}