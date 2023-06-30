import 'package:flutter/material.dart';
import 'package:wigets_app/config/theme/app_theme.dart';
import 'package:wigets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:wigets_app/presentation/screens/cards/cards_screen.dart';
import 'package:wigets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme(selectedColor: 3).getTheme() ,
      debugShowCheckedModeBanner: false,
      home: const  HomeScreen(),
      routes: {
        '/buttons' : (context) => const ButtonsSreen(),
        '/cards' : (context) => const CardsScreen(),
      },
    );
  }
}
