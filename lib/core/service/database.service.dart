import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final supabase = Supabase.instance.client;
  Future fetchData() async {
    try {
      final response = await supabase.from("test_db").select();
      print(response);
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
}
