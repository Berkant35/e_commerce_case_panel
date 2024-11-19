import 'package:ECommercePanel/core/routes/route_names.dart';
import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';
import 'package:ECommercePanel/features/category/presentation/pages/category_detail.dart';
import 'package:ECommercePanel/features/product/presentation/pages/product_page.dart';
import 'package:go_router/go_router.dart';
import '../../features/category/presentation/pages/category_page.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
          path: '/category',
          name: RouteNames.category,
          builder: (context, state) => const CategoryPage()),
      GoRoute(
          path: '/categoryDetail',
          name: RouteNames.categoryDetail,
          builder: (context, state) {
          return const CategoryDetail(); // Ekrana parametreyi gönder
        },
      ),
      GoRoute(
          path: '/product',
          name: RouteNames.product,
          builder: (context, state) => const ProductPage()),
    ],
  );
}
