import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';

import 'package:elpcd_dart/src/database/hive_database.dart';
import 'package:elpcd_dart/src/managers/managers.dart';
import 'package:elpcd_dart/src/core/app.dart';

void main() async {
  await HiveDatabase.instance.initDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeManager()),
        Provider(create: (_) => TreeController(allNodesExpanded: true)),
      ],
      child: ElPCDApp(),
    ),
  );
}
