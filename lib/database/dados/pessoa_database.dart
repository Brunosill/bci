// ignore_for_file: prefer_collection_literals, unused_local_variable

import 'package:bci/database/dao/dao_base/pessoas/pessoajuridica_dao.dart';
import 'package:bci/database/dao/dao_base/pessoas/pessoafisica_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'pessoas.db');
  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute(PessoaJuridicaDao.tablePJ,);
      db.execute(PessoaFisicaDao.tablePF,);
  }, version: 2,

  onDowngrade: onDatabaseDowngradeDelete,
  );
}