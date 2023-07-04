import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wigets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

//Un simple int
final selecedColorProvider = StateProvider((ref) => 0); 

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNoifier, AppTheme>(
  (ref) => ThemeNoifier()
);


// Controller o Notifier
class ThemeNoifier extends StateNotifier<AppTheme> {

  //StATE = Estado = new AppTheme();
  ThemeNoifier(): super( AppTheme() );

  void toggleDarkmode() {
    state = state.coyWidth( isDarkmode: !state.isDarkmode );
  }

  void changeColorIndex( int colorIndex ) {
    state = state.coyWidth( selectedColor: colorIndex );
  }


}



