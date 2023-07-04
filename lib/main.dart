import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wigets_app/config/router/app_router.dart';
import 'package:wigets_app/config/theme/app_theme.dart';
import 'package:wigets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp())
    );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // final int color = ref.watch( selecedColorProvider ); 
    // final bool isDarkmode = ref.watch( isDarkmodeProvider ); 

    final AppTheme appTheme = ref.watch( themeNotifierProvider );

    return  MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      theme: appTheme.getTheme() ,
      debugShowCheckedModeBanner: false,
      
    );
  }
}
