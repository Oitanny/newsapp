import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/presentation/screens/homepage.dart';
import 'package:newsapp/presentation/screens/mainscr.dart';
import 'package:newsapp/presentation/screens/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 15.0),

                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50,),
                            Text("Welcome", style: TextStyle(fontSize: 30, color:Color(0xFF1a1a1a)),),
                            Text("Fill your details to login"),
                            SizedBox(height: 10,),
                            Container(
                              height: 3,
                              width: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft
                                )
                            ),)
                          ],
                        )
                        /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                        // child: Image.asset('asset/images/flutter-logo.png')),
                                    ),
                  ),
              ),
              SizedBox(height: 40,),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(

                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              TextButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                    ),
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MainScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('New User?'),
                  TextButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>SignUpPage()));
                  }, child: Text("Create Account", style: TextStyle(color: Colors.purple),))
                ],
              )
            ],
          ),
        ),
      );
  }
}
