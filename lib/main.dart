import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_controle/firebase_options.dart';
import 'package:flutter_application_controle/screens/home.page.dart';
import 'package:flutter_application_controle/screens/login.page.dart';
import 'package:flutter_application_controle/screens/register.page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
        ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true),
      title: "Harmouchi flutter App",
     // home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/login':(context)=>LoginPage(),
        '/register':(context)=>RegisterPage(),
        '/home':(context)=>HomePage(),

      },
    );

  }
  
}