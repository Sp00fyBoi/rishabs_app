import 'package:flutter/material.dart';
import 'config/app_router.dart';
import 'config/app_theme.dart';
import 'core/initialization/app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize app
  await AppInitializer.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rishabh\'s App',
      theme: AppTheme.getLightTheme(),
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.getDarkTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
