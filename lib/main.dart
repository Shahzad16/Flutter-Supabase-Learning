import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/app/providers/app.provider.dart';
import 'package:flutter_supabase_tutorial/app/routes/app.routes.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ovaqivdmbdjxxunnrctm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im92YXFpdmRtYmRqeHh1bm5yY3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjMwNjIwODgsImV4cCI6MjAzODYzODA4OH0.3mkJ6yJq7aSwYIUGUGvbEgfZ98KUfMcdXKPU0hj3Hz0',
     authOptions: const FlutterAuthClientOptions(
    authFlowType: AuthFlowType.pkce,
  ),

   realtimeClientOptions: const RealtimeClientOptions(
    logLevel: RealtimeLogLevel.info,
  ),
  storageOptions: const StorageClientOptions(
    retryAttempts: 10,
  ),
  );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppProviders.providers,
        child: MaterialApp(
          initialRoute: AppRoutes.LoginRoute,
          routes: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
        ));
  }
}
