import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ChatWidgetBubble extends StatelessWidget {
  const ChatWidgetBubble({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 59, 6, 33),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )),
          child: Text(
            msg,
            style: Style.font18SemiBold(context).copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}

class ChatWidgetBubblefriend extends StatelessWidget {
  const ChatWidgetBubblefriend({super.key, required this.msg});
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 146, 72, 146).withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
        child: Text(
          msg,
          style: Style.font18SemiBold(context).copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
