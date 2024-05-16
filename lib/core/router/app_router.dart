import 'package:go_router/go_router.dart';

import '../../module/app_home/view/app_view.dart';
import '../../module/products/model/product.dart';
import '../../module/products/view/product_details/product_details.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';
  static const String productDetails = '/productDetails/:product';

  static final _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (context, state) => const AppView(),
        routes: <RouteBase>[
          GoRoute(
            path: 'productDetails/:product',
            builder: (context, state) => ProductDetails(product: state.extra as Product),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
