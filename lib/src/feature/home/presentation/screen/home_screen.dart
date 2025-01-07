import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();
    final currentUserId = authService.getCurrentUserId();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(currentEmail.toString()),
          Text(currentUserId.toString()),
        ],
      ),
    );
  }
}
