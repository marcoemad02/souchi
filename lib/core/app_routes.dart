
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import 'package:souchi/views/pages/fried_category_page.dart';
import 'package:souchi/views/pages/raw_category_page.dart';
import 'package:souchi/views/pages/sauces_category_page.dart';
import '../splash_view/persentation/splash_view.dart';
import '../views/pages/home_page.dart';

final List<GetPage> appRoutes=[
  GetPage(name: '/', page: () => const SplashView(),),
  GetPage(name: '/Home', page: () => const HomePage(),),
  GetPage(name: '/RawCategoryPage', page: () => const RawCategoryPage(),),
  GetPage(name: '/FriedCategoryPage', page: () => const FriedCategoryPage(),),
  GetPage(name: '/SaucesCategoryPage', page: () => const SaucesCategoryPage(),)
];




// abstract class AppRouter {
//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',      //initil page aw start page
//         builder: (context, state) => const SplashView(),
//       ),
//       GoRoute(
//         path: '/homePage',
//         builder: (context, state) => const HomePage(),
//       ),
//
//     ],
//   );
// }
