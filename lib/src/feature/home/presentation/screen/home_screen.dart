import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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

  // late String deeplink;

  Future<String> callPaymentApi() async {
    String baseURL = 'https://bf53-2405-4800-5716-7670-d1b-481e-9f75-ac2b.ngrok-free.app/payment';
    var res = await http.post(Uri.parse(baseURL), headers: {
      "Content-Type": "application/json",
    });
    print(res.statusCode);
    print(res.body);
    final data = jsonDecode(res.body);
    print(data['deeplink']);
    // deeplink = data['deeplink'];
    // return res;
    return data['deeplink'];
  }

  // String getDeepLink() {
  //   http.Response res = callPaymentApi() as http.Response;
  //   final data = jsonDecode(res.body);
  //   return data['deeplink'];
  // }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();
    final currentUserId = authService.getCurrentUserId();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(currentEmail.toString()),
            Text(currentUserId.toString()),
            ElevatedButton(
              onPressed: () async {
                String url = await callPaymentApi();
                Uri uri = Uri.parse(url);
                await launchUrl(uri);
              },
              child: const Text("Button"),
            ),
          ],
        ),
      ),
    );
  }
}
