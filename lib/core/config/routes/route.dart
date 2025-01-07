import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/layer/initial_layer.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/not_found_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/login_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/register_screen.dart';

Route<dynamic> appRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutePath.root:
      return MaterialPageRoute(builder: (_) => const InitialLayer());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case RoutePath.register:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());

    default:
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
