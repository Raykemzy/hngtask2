// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DisplayApp',
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: prefer_typing_uninitialized_variables
  var name;
  String url = 'https://internship.zuri.team/';
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 36.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Image(
                    image: AssetImage('assets/images/hng_logo.png'),
                  ),
                  margin: EdgeInsets.only(bottom: 10.0),
                ),
                Divider(
                  thickness: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.grey),
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Hi, what's your name?",
                            hintStyle: TextStyle(
                              fontSize: 26.0,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          onSubmitted: (name) {
                            setState(() {
                              name = nameController.text;
                            });
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0D47A1),
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                          Positioned(
                            top: 5.0,
                            left: 6.0,
                            child: IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                setState(() {
                                  name = nameController.text;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  "Hi $name, click on the link below to visit the HNG site",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic
                      //foreground: Paint()..shader = ui.Gradient.linear(),
                      ),
                ),
                SizedBox(height: 10.0),
                InkWell(
                  child: ButtonTheme(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        side: BorderSide(width: 2.0),
                        maximumSize: Size(100.0, 50.0),
                      ),
                      onPressed: () => {launch(url)},
                      child: Center(
                        child: Text('HNG'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
