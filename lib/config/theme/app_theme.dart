import 'package:flutter/material.dart';

  const colorList = <Color>[
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.yellow,
    Colors.brown,
    Colors.grey,
    Colors.pink
  ];

class AppTheme {

  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.isDarkmode = false, 
    this.selectedColor = 0
  }):assert( selectedColor >= 0, 'Selected color must be grater then 0' ),
    assert( selectedColor < colorList.length, 'Selected color must less or equal than ${colorList.length}' );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkmode ? Brightness.dark : Brightness.light ,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme( centerTitle: true )
  );

}