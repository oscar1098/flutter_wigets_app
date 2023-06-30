import 'package:flutter/material.dart';

import '../../../config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3')
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        
        final menuTitle = appMenuItems[index];
        return _CustomListTile(menuTitle: menuTitle)  ;
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuTitle,
  });

  final MenuItem menuTitle;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuTitle.icon, color: colors.primary),
      trailing: Icon( Icons.arrow_forward_rounded, color: colors.primary, ),
      title: Text( menuTitle.title ),
      subtitle: Text(menuTitle.subtitle),
      onTap: () {
        //TODO Navegar otra pantalla
      },
    );
  }
}