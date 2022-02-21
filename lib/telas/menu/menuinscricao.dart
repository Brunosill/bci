import 'package:flutter/material.dart';

class MenuInscricao extends StatefulWidget{
  @override
  State<MenuInscricao> createState() => _MenuInscricaoState();
}

class _MenuInscricaoState extends State<MenuInscricao> {
  late int _index = 0;
  final List<Widget> _pages = []
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value){
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            title: Text('Inscrição'),
            icon: Icon(Icons.home_work_outlined)
          ),
          BottomNavigationBarItem(
            title: Text('Nova Inscrição'),
            icon: Icon(Icons.add_box_outlined)
          )
        ]
      )
    );
  }
}