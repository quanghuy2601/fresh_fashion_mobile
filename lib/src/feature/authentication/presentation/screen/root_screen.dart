import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final authService = AuthService();

  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();
    final currentUserId = authService.getCurrentUserId();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Root Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
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
