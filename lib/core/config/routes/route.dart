import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/layer/initial_layer.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/not_found_screen.dart';

Route<dynamic> appRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutePath.root:
      return MaterialPageRoute(builder: (_) => const InitialLayer());
    default:
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
