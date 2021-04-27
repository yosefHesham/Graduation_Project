import 'package:flutter/material.dart';
import 'package:re7al/Models/MyNavigationBar.dart';
import 'package:re7al/Models/Places.dart';

class Museums extends StatefulWidget {
  @override
  _MuseumsState createState() => _MuseumsState();
}

class _MuseumsState extends State<Museums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          flexibleSpace: SafeArea(child: SearchBar()),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 15, left: 20),
                          child: Text(
                            'Welcome in  CityName',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 15, bottom: 10),
                          child: Text(
                            'Nearest Places',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 20, bottom: 15),
                        ),

                        Story(),
                        //Story(),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 15, bottom: 15),
                          child: Text(
                            'Best places',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Places(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
