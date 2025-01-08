import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:fresh_fashion_mobile/src/feature/home/presentation/widgets/avatar_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

  Future<void> aaa() async {
    final supabase = Supabase.instance.client;
    await supabase.from('imageList').insert({'image': 'this is image url'});
  }

  Future<String> callPaymentApi() async {
    String baseURL = 'https://f355-2405-4800-5716-7670-25a4-cbe1-fb3a-17eb.ngrok-free.app/payment';
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

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();
    final currentUserId = authService.getCurrentUserId();

    final SupabaseClient supabase = Supabase.instance.client;

    Future<String> aaa() async {
      final data = await supabase.from('imageList').select();
      print(data.first['image']);

      return data.first['image'];
    }

    String? _imageUrl;

    String aaaaaa = 'https://grseyivysdcnyerrdhak.supabase.co/storage/v1/object/public/imageList//e2408a45-dfcf-44a7-8cf4-ecf21b1d72b7/imageList?t=1736371464273';

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
            // Text(currentEmail.toString()),
            // Text(currentUserId.toString()),
            // ElevatedButton(
            //   onPressed: () async {
            //     String url = await callPaymentApi();
            //     Uri uri = Uri.parse(url);
            //     await launchUrl(uri);
            //   },
            //   child: const Text("Button"),
            // ),
            const SizedBox(height: 12),
            AvatarWidget(
                imageUrl: _imageUrl,
                onUpload: (imageUrl) async {
                  // print(imageUrl);
                  await supabase.from('imageList').insert({'image': imageUrl});
                  setState(() {
                    _imageUrl = imageUrl;
                  });
                  // final userId = supabase.auth.currentUser!.id;
                }),
            ElevatedButton(
              onPressed: () async {
                String link = await aaa();
                setState(() {
                  aaaaaa = link;
                });
              },
              child: const Text("Button"),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.network(
                aaaaaa,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
