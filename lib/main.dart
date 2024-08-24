import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_supabase_tutorial/app/providers/app.provider.dart';
import 'package:flutter_supabase_tutorial/app/routes/app.routes.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['url']!,
    anonKey: dotenv.env['anon_key']!,
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
