import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/presentation/screens/homepage.dart';
import 'package:newsapp/presentation/screens/login.dart';

// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin{
//   @override
//   void initState(){
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//   }
//
//   @override
//   void dispose(){
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0, left: 15.0),
//
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 50,),
//                         Row(children: [
//                           Icon(Icons.newspaper, size: 32,),
//                           SizedBox(width: 5,),
//                           Text("NewsExpo", style: TextStyle(fontSize: 30, color:Color(0xFF1a1a1a)),),
//
//                         ],),
//                         Text("Fill your details to sign up"),
//                         SizedBox(height: 10,),
//                         Container(
//                           height: 3,
//                           width: 200,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
//                                   begin: Alignment.topRight,
//                                   end: Alignment.bottomLeft
//                               )
//                           ),)
//                       ],
//                     )
//                   /*decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(50.0)),*/
//                   // child: Image.asset('asset/images/flutter-logo.png')),
//                 ),
//               ),
//             ),
//             SizedBox(height: 40,),
//             Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText: 'Enter valid email id as abc@gmail.com'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter secure password'),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
//                       begin: Alignment.topRight,
//                       end: Alignment.bottomLeft
//                   ),
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => HomePage()));
//                 },
//                 child: Text(
//                   'Sign Up',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 130,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 Text('Existing User?'),
//                 TextButton(onPressed: (){
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage()));
//
//                 }, child: Text("Login Here", style: TextStyle(color: Colors.purple),))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newsapp/data/models/user.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<String> _newsPreferences = []; // List to store selected news preferences
  String _avatarPic = ''; // You can set a default value or leave it empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        SizedBox(height: 20,),
                        Row(children: [
                          Icon(Icons.newspaper, size: 32,),
                          SizedBox(width: 5,),
                          Text("NewsExpo", style: TextStyle(fontSize: 30, color:Color(0xFF1a1a1a)),),

                        ],),
                        Text("Fill your details to sign up"),
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
            SizedBox(height: 20,),
            Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              MultiSelectFormField(
                title: Text("News Preferences"),
                dataSource: [
                  // Add your news preference options here
                  {
                    "display": "Sports",
                    "value": "Sports",
                  },
                  {
                    "display": "Politics",
                    "value": "Politics",
                  },
                  {
                    "display": "Entertainment",
                    "value": "Entertainment",
                  },
                  {
                    "display": "Education",
                    "value": "Education",
                  },
                  // Add more options as needed
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
                initialValue: _newsPreferences,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _newsPreferences = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  ),
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create a User object with the form data
                    User user = User(
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      newsPreferences: _newsPreferences,
                      avatarPic: _avatarPic,
                    );

                    // Store the user data in Firebase collection
                    FirebaseFirestore.instance
                        .collection('users')
                        .add(user.toJson())
                        .then((value) {
                      print('User added successfully!');
                      // Navigate to the next screen or perform other actions
                    }).catchError((error) {
                      Fluttertoast.showToast(msg:'Failed to add user: $error');
                    });
                  }
                },
                child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 20),),
              )),
              //             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
//                       begin: Alignment.topRight,
//                       end: Alignment.bottomLeft
//                   ),
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => HomePage()));
//                 },
//                 child: Text(
//                   'Sign Up',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Existing User?'),
                TextButton(onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage()));

                }, child: Text("Login Here", style: TextStyle(color: Colors.purple),))
              ],
            )

            ],
          ),
        ),
      ),
    ])));
  }
}
