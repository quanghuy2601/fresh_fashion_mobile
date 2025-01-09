import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/ui/resource/image_path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Future<String> callPaymentApi() async {
    String baseURL = 'https://10a4-2405-4800-5716-7670-b0e9-2947-b03e-ea8e.ngrok-free.app/payment';
    var res = await http.post(Uri.parse(baseURL), headers: {
      "Content-Type": "application/json",
    });
    print(res.statusCode);
    print(res.body);
    final data = jsonDecode(res.body);
    print(data['deeplink']);
    return data['deeplink'];
  }

  String sizeChoosen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết sản phẩn"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    ImagePath.a,
                    fit: BoxFit.contain,
                  ),
                ),
                const Text("Sản phẩm 1"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _comboSize("S"),
                    const SizedBox(width: 20),
                    _comboSize("M"),
                    const SizedBox(width: 20),
                    _comboSize("L"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "100 000đ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _paymentButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _comboSize(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sizeChoosen = size;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 25,
        width: 25,
        // color: Colors.amber,
        decoration: BoxDecoration(
          color: sizeChoosen == size ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: sizeChoosen == size ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _paymentButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () async {
          String url = await callPaymentApi();
          Uri uri = Uri.parse(url);
          await launchUrl(uri);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text(
            "Thanh Toán",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
