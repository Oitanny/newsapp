import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/business_logic/handlers/userprovider.dart';
import 'package:newsapp/presentation/screens/homepage.dart';
import 'package:newsapp/presentation/screens/login.dart';
import 'package:newsapp/presentation/screens/mainscr.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
with SingleTickerProviderStateMixin
{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CheckAuthPage()));
    });
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
          begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.newspaper , size: 82,color: Colors.white),
            SizedBox(height:20),
            Text('NewsExpo', style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize:32,
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}

class CheckAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        if (userProvider.user != null) {
          // User is logged in, navigate to the home page
          return MainScreen();
        } else {
          // User is not logged in, navigate to the login page
          return LoginPage();
        }
      },
    );
  }
}
