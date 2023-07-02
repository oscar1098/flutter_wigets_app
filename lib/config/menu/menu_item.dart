import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem> [
  MenuItem(
    title: 'Botones', 
    subtitle: 'Varios Botones en flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas', 
    subtitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators', 
    subtitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y dialogos', 
    subtitle: 'Indicadores en pantalla', 
    link: '/sanckbars', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated container', 
    subtitle: 'Stateful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_outlined
  ),

  MenuItem(
    title: 'UI controls + Tiles', 
    subtitle: 'Una serie de controles de lflutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
  ),
];