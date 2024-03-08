import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/business_logic/handlers/userprovider.dart';
import 'package:newsapp/presentation/screens/splashscreen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyDmKcxMH1PuowLbMvHbp2hvcdZM1953vE4',
        appId: '1:940555539305:android:728a88429821eb6b7663f8',
        messagingSenderId: '940555539305',
        projectId: 'newsapp-5351d',
      storageBucket: 'your_storage_bucket',

    )

  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider()..checkUserLoggedIn(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}
