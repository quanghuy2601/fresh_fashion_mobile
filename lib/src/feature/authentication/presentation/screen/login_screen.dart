import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Future<http.Response> callPaymentApi() async {
      String baseURL = 'https://6ab7-2405-4800-5716-7670-c541-f6c9-4278-1f3e.ngrok-free.app/payment';
      var res = await http.post(Uri.parse(baseURL), headers: {
        "Content-Type": "application/json",
      });
      print(res.statusCode);
      print(res.body);
      return res;
    }

    final authService = AuthService();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void login() async {
      final email = emailController.text;
      final password = passwordController.text;

      try {
        await authService.signInWithEmailPassword(email, password);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: $e")),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(label: Text("Email")),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(label: Text("Password")),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: login,
            child: const Text("Login"),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutePath.register);
            },
            child: const Center(
              child: Text("Don't have an account? Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
