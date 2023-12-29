import 'package:flutter/material.dart';
import 'package:scholar_chat_app/views/ChatView.dart';
import 'package:scholar_chat_app/views/LoginView.dart';
import 'package:scholar_chat_app/views/SignUpView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    routes: {
      LoginView.id : (context)=>  LoginView(),
      SignUpView.id : (context)=>  SignUpView(),
      ChatView.id : (context)=>   ChatView(),
    },
    debugShowCheckedModeBanner: false,
    initialRoute: LoginView.id,
  ));
}

