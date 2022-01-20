// ignore_for_file: prefer_collection_literals, unused_local_variable

import 'package:bci/database/dao/empresarial_dao.dart';
import 'package:bci/database/dao/proprietario_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bci.db');
  return openDatabase(path,
    onCreate: (db, version){
      db.execute(EmpresarialDao.empresarialSql,);
      db.execute(ProprietarioDao.tableSql,);
  }, version: 1,
  onDowngrade: onDatabaseDowngradeDelete,
  );
}