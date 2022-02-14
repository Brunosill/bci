import 'package:bci/telas/list/proprietario_list.dart';
import 'package:flutter/material.dart';

import 'list/proprietario_list.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boletim Imobiliário'),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround, //spaceBetween
          crossAxisAlignment: CrossAxisAlignment.start, //start
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              //child: Text('Cadastro Imobiliario'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _FeatureItem(
                      'Proprietário',
                      Icons.account_box,
                      onClick: () {
                        _showProprietarioList(context);
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProprietarioList(context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProprietarioList(),
      )
    );
  }
}

class _FeatureItem extends StatelessWidget{
  final String name;
  final IconData icon;
  final Function onClick;

  const _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(

        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: const EdgeInsets.all(8.0),

            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: Colors.white, size: 50.0,),
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 20.00),)
              ],
            ),
          ),
        ),
      )

    );
  }
}