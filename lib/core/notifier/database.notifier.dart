import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/core/models/data.model.dart';
import 'package:flutter_supabase_tutorial/core/service/database.service.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  Future fetchData() async {
    List data = await _databaseService.fetchData();
    return data.map((dataElement) => Data.fromJson(dataElement)).toList();
  }

  Future insertData(
      {required String title, required String description}) async {
    await _databaseService.insertData(title: title, description: description);
  }

  Future updateData(
      {required int id, String? title, String? description}) async {
    await _databaseService.updateData(
        id: id, title: title, description: description);
  }

  Future deleteData({required int id}) async {
    await _databaseService.deleteData(id: id);
  }
}
