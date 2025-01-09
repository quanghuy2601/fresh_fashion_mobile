import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông báo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          _chatWidget(),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

  Widget _chatWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutePath.message);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.grey,
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Chat",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
