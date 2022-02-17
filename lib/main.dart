import 'package:app_toxicidade/widgets/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyALfSiIBv5wwKwMQvdfketMue_S3epdq4g",
      authDomain: 'nexo-fd388.firebaseapp.com',
      databaseURL: 'nexo-fd388.firebaseio.com',
      projectId: 'nexo-fd388',
      storageBucket: 'nexo-fd388.appspot.com',
      messagingSenderId: '227787007278',
      appId: '1:227787007278:web:d6055ee678cd9a0c1786bf',
      measurementId: 'G-109EE03DYX',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acessar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Login(),
      home: const Wrapper(),
    );
  }
}
