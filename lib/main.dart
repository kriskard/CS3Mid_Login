import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Screens/login.dart';
import './Screens/signup.dart';
import './Screens/home.dart';
import './Screens/album.dart';
import './Screens/image.dart';
import 'package:dio/dio.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignupScreen.routeName: (context) => const SignupScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          AlbumScreen.routeName: (context) => const AlbumScreen(),
          ImageScreen.routeName: (context) => const ImageScreen(),
        },
      );
  }
}
