import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/layer/initial_layer.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/not_found_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/login_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/register_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/home/presentation/screen/product_detail_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/notification/presentation/message_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/presentation/shop_register_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/presentation/shop_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/presentation/update_profile_screen.dart';

Route<dynamic> appRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutePath.root:
      return MaterialPageRoute(builder: (_) => const InitialLayer());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case RoutePath.register:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case RoutePath.updateProfile:
      return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
    case RoutePath.shopRegister:
      return MaterialPageRoute(builder: (_) => const ShopRegisterScreen());
    case RoutePath.shop:
      return MaterialPageRoute(builder: (_) => const ShopScreen());
    case RoutePath.productDetail:
      return MaterialPageRoute(builder: (_) => const ProductDetailScreen());
    case RoutePath.message:
      return MaterialPageRoute(builder: (_) => const MessageScreen());

    default:
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
