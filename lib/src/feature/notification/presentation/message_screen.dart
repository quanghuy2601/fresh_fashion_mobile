import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

final supabase = Supabase.instance.client;
final authService = AuthService();

class _MessageScreenState extends State<MessageScreen> {
  final _stream = supabase.from('chat_table').stream(primaryKey: ['id']);

  String? userId = authService.getCurrentUserId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin nhắn'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Lỗi khi tải dữ liệu'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                if (snapshot.data![index]['userId'] == userId) {
                  return _myTextWidget(snapshot.data![index]['chat']);
                } else {
                  return _yourTextWidget(snapshot.data![index]['chat']);
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget _myTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 10, 10, 10),
      child: Container(
        height: 55,
        width: 100,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _yourTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 70, 10),
      child: Container(
        height: 55,
        width: 100,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
