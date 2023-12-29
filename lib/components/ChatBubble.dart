import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  String message;
   ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
            left: 24,
            top: 32,
            bottom: 32,
            right: 24,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child:  Text(message,
          style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  String message;
  ChatBubbleForFriend({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(
          left: 24,
          top: 32,
          bottom: 32,
          right: 24,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xFF006D84),
        ),
        child:  Text(message,
          style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}