import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => ButtonsSreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
  ],
);