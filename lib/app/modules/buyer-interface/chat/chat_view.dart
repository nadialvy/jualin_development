// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
