import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/core/ui/resource/image_path.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authService = AuthService();

  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trang chủ'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _productWidget("Sản phẩm 1", ImagePath.a, "100 000đ"),
              _productWidget("Sản phẩm 2", ImagePath.b, "70 000đ"),
              _productWidget("Sản phẩm 3", ImagePath.c, "50 000đ"),
              _productWidget("Sản phẩm 4", ImagePath.d, "30 000đ"),
              _productWidget("Sản phẩm 5", ImagePath.e, "200 000đ"),
              _productWidget("Sản phẩm 6", ImagePath.f, "10 000đ"),
            ],
          ),
        ));
  }

  Widget _productWidget(String productName, String imagePath, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePath.productDetail);
      },
      child: Row(
        children: [
          SizedBox(
            height: 155,
            width: 155,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
