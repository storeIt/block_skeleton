import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColorDark: Colors.black12,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.grey.shade50),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
