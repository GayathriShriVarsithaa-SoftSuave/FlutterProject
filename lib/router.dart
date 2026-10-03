import 'package:go_router/go_router.dart';

import './home.dart';

import './login.dart';

GoRouter router=GoRouter(routes:[
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) {
      final password = state.extra as String;
      return Home(password: password);
    }
  ),
]);