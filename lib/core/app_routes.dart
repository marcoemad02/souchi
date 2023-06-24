
import 'package:go_router/go_router.dart';
import '../splash_view/persentation/splash_view.dart';
import '../views/pages/home_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',      //initil page aw start page
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homePage',
        builder: (context, state) => const HomePage(),
      ),

    ],
  );
}
