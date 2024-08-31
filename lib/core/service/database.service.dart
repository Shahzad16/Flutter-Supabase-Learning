import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final supabase = Supabase.instance.client;
  Future fetchData() async {
    try {
      var response = await supabase.from("test_db").select();
      var data = response;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future insertData(
      {required String title, required String description}) async {
    try {
      final response = await supabase
          .from("test_db")
          .insert({"title": title, "description": description});
      if (response.data != null) {
        print(response.data);
      } else {
        print(response.error);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateData(
      {required int id, String? title, String? description}) async {
    try {
      final response = await supabase
          .from('test_db')
          .update({'title': title, 'description': description})
          .eq('id', id)
          .select(); // update & return the updated data
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData({required int id}) async {
    try {
      final response = await supabase.from("test_db").delete().eq('id', id);
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
