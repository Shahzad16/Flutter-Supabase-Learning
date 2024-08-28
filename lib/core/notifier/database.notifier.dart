import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/core/service/database.service.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService _databaseService = new DatabaseService();

  Future fetchData() async {
    await _databaseService.fetchData();
  }

  Future insertData(
      {required String title, required String description}) async {
    await _databaseService.insertData(title: title, description: description);
  }
}
