import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elpcd_dart/src/views/description/description_view.dart';
import 'package:elpcd_dart/src/database/hive_database.dart';
import 'package:elpcd_dart/src/managers/managers.dart';
import 'package:elpcd_dart/src/views/views.dart';
import 'package:elpcd_dart/src/utils/utils.dart';

class HomeManager with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScaffoldState get scaffold => scaffoldKey.currentState;

  void openDescription(BuildContext context, DescriptionManager manager) {
    context.display(DescriptionView(manager));
  }

  Future<void> saveCodearq(BuildContext context, String value) async {
    String codearq = value.isEmpty ? 'ElPCD' : value;
    await HiveDatabase.settingsBox.put('codearq', codearq);
    context.pop();
    ShowSnackBar.info(
      context.read<HomeManager>().scaffold,
      'CODEARQ alterado para ➜ $codearq',
    );
  }
}
