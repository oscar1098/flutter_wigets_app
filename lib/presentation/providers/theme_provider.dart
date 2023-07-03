import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wigets_app/config/theme/app_theme.dart';


final colorListProvider = Provider((ref) => colorList);

final isDarkmodeProvider = StateProvider((ref) => false);

final selecedColorProvider = StateProvider((ref) => 0); 


