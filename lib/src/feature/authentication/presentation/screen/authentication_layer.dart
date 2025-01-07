import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/login_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/root_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationLayer extends StatefulWidget {
  const AuthenticationLayer({super.key});

  @override
  State<AuthenticationLayer> createState() => _AuthenticationLayerState();
}

class _AuthenticationLayerState extends State<AuthenticationLayer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return const RootScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
