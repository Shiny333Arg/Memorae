import 'package:flutter/material.dart';
import 'features/alerts/home.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MemoraeApp());
}

class MemoraeApp extends StatelessWidget {
  const MemoraeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorae',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(), // redirige a home.dart
    );
  }
}
