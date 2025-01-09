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

  final TextEditingController messageController = TextEditingController();

  Future<void> sendMessage() async {
    await supabase.from('chat_table').insert({
      'chat': messageController.text,
      'userId': userId,
    });
    messageController.text = '';
  }

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
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Stack(
                children: [
                  _inputMessage(),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data![index]['userId'] == userId) {
                        return _myTextWidget(snapshot.data![index]['chat']);
                      } else {
                        return _yourTextWidget(snapshot.data![index]['chat']);
                      }
                    },
                  ),
                ],
              ),
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

  Widget _inputMessage() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 670, left: 10, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Nhập tin nhắn...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.black),
              onPressed: sendMessage,
            ),
          ],
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
