import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials {
  static const String APIKEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im92YXFpdmRtYmRqeHh1bm5yY3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjMwNjIwODgsImV4cCI6MjAzODYzODA4OH0.3mkJ6yJq7aSwYIUGUGvbEgfZ98KUfMcdXKPU0hj3Hz0';
  static const String APIURL = 'https://ovaqivdmbdjxxunnrctm.supabase.co';

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
