import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }


  bool isGridView = false;
  List<String> newsArticles = List.generate(20, (index) => 'News Article ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
                width: double.infinity,
                child: Column(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
          
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child:
                    Row(children: [
                      CircleAvatar(
                        minRadius: 30,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back!", style: TextStyle(color: Colors.grey, fontSize: 14),),
                          Text("Markys 👋", style: TextStyle(color: Color(0xFF1a1a1a), fontSize: 18),)
                        ],
                      )
                ])),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded, color: Color(0xFF1a1a1a),size: 30,))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
          
          
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Search...",
          
          
                ),
              ),
          ),
          Padding(padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                  alignment:Alignment.centerLeft,
                  child: Text("Hot News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
            SizedBox(height: 7,),
            Align(
              alignment:Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   Container(
                      width: 60, // Specify a width
                      height: 60, // Specify a height
                      child: CircleAvatar(
                        radius: 30, // Specify the radius
                        child: Text("+"),
                      ),
                    ),
                   Row(
                    children: List.generate(
                      10,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 60, // Specify a width
                              height: 60, // Specify a height
                              child: CircleAvatar(
                                radius: 30, // Specify the radius
                                child: Text((index + 1).toString()),
                              ),
                            ),
                      ),
                    ),
                  ),]
                ),
            )
          
          ),
          
            ]
          )
          ),
                Padding(padding: EdgeInsets.all(15.0),
            child: Column(
                children: [
                Align(
                alignment:Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    IconButton(
                      icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
                      onPressed: () {
                        setState(() {
                          isGridView = !isGridView;
                        });
                      },
                    ),
          
                  ],
                )),
            SizedBox(height: 7,),
            Align(
                alignment:Alignment.centerLeft,
                child: Container(
          height: MediaQuery.of(context).size.height-500,
          child: isGridView
              ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                  child: Text(newsArticles[index]),
                ),
              );
            },
          )
              : ListView.builder(
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(newsArticles[index]),
                ),
              );
            },
          ),
                ),
                )
                ]),
                )])),
        ),




    );
  }
}

class CustomNotchedRectangle extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);
    const double s1 = 15.0; // Notch depth
    const double s2 = 30.0; // Curvature
    final double r = guest.width / 2.0 + s1 * s1 / (guest.width * 8.0);
    final double dy = r - sqrt(r * r - s1 * s1 / 4.0);
    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(guest.left, host.top)
      ..lineTo(guest.left, guest.top + s1)
      ..arcToPoint(
        Offset(guest.right, guest.top + s1),
        radius: Radius.circular(s2),
        clockwise: false,
      )
      ..lineTo(guest.right, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
