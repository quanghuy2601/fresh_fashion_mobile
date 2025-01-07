import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    void signUp() async {
      final email = emailController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password don't match")),
        );
        return;
      }

      try {
        await authService.signUpWithEmailPassword(email, password);
        Navigator.pop(context);
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
        title: const Text('Register'),
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
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(label: Text("Confirm Password")),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: signUp,
            child: const Text("Sign Up"),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Text("Have an account? Login"),
            ),
          ),
        ],
      ),
    );
  }
}
