import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

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
        return _CustomListTile(menuItem: menuTitle)  ;
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon( Icons.arrow_forward_rounded, color: colors.primary, ),
      title: Text( menuItem.title ),
      subtitle: Text(menuItem.subtitle),
      onTap: () {

       context.push(menuItem.link);

      },
    );
  }
}