import 'package:flutter/material.dart';
import 'package:gemini_chat_bot/featuers/chat/presentation/views/chat_view.dart';

void main() {
  runApp(const GeminiApp());
}

class GeminiApp extends StatelessWidget {
  const GeminiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatView(),
    );
  }
}
