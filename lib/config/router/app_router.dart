import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsSreen.name,
      builder: (context, state) => const ButtonsSreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);