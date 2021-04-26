import 'package:flutter/material.dart';
import './widgets/appbar_buttons.dart';

void main() {
  runApp(MaterialApp(
    title: "Lab Exercice One",
    theme: ThemeData(primarySwatch: Colors.brown),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isAppBar = true;
  var isColors = true;
  double _size = 200;
  var _red = 0;
  var _green = 0;
  var _blue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: isAppBar
            ? <Widget>[
                AppBarButton(
                    onPressed: () {
                      setState(() {
                        _size -= _size > 100 ? 50 : 0;
                      });
                    },
                    buttonText: "-"),
                AppBarButton(
                    onPressed: () {
                      setState(() {
                        _size = 100;
                      });
                    },
                    buttonText: "S"),
                AppBarButton(
                    onPressed: () {
                      setState(() {
                        _size = 200;
                      });
                    },
                    buttonText: "M"),
                AppBarButton(
                    onPressed: () {
                      setState(() {
                        _size = 400;
                      });
                    },
                    buttonText: "L"),
                AppBarButton(
                    onPressed: () {
                      setState(() {
                        _size += _size < 400 ? 50 : 0;
                      });
                    },
                    buttonText: "+"),
              ]
            : null,
        title: Text("My Icon"),
      ),
      drawer: buildDrawer(),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 120),
              child: Icon(
                Icons.alarm,
                size: _size,
                color: Color.fromRGBO(_red, _green, _blue, 1),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        child: Container(
          height: 196,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Slider(
                        divisions: 255,
                        min: 0,
                        max: 255,
                        value: _red.toDouble(),
                        onChanged: (double s) {
                          setState(
                            () {
                              _red = s.toInt();
                            },
                          );
                        },
                      ),
                    ),
                    isColors
                        ? FloatingActionButton.extended(
                            onPressed: () {
                              setState(() {
                                _red = 255;
                                _green = 0;
                                _blue = 0;
                              });
                            },
                            label: Text("$_red"),
                            backgroundColor: Colors.red,
                          )
                        : Text("$_red"),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Slider(
                        divisions: 255,
                        min: 0,
                        max: 255,
                        value: _green.toDouble(),
                        onChanged: (double s) {
                          setState(
                            () {
                              _green = s.toInt();
                            },
                          );
                        },
                      ),
                    ),
                    isColors
                        ? FloatingActionButton.extended(
                            onPressed: () {
                              setState(() {
                                _red = 0;
                                _green = 255;
                                _blue = 0;
                              });
                            },
                            label: Text("$_green"),
                            backgroundColor: Colors.green,
                          )
                        : Text("$_green"),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Slider(
                        divisions: 255,
                        min: 0,
                        max: 255,
                        value: _blue.toDouble(),
                        onChanged: (double s) {
                          setState(
                            () {
                              _blue = s.toInt();
                            },
                          );
                        },
                      ),
                    ),
                    isColors
                        ? FloatingActionButton.extended(
                            onPressed: () {
                              setState(() {
                                _red = 0;
                                _green = 0;
                                _blue = 255;
                              });
                            },
                            label: Text("$_blue"),
                            backgroundColor: Colors.blue,
                          )
                        : Text("$_blue"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CheckboxListTile(
            activeColor: Colors.white,
            title: Text("Allow Resize"),
            value: isAppBar,
            onChanged: (val) {
              setState(() => isAppBar = val);
            },
          ),
          CheckboxListTile(
            activeColor: Colors.white,
            title: Text("Allow Change Primer Color"),
            value: isColors,
            onChanged: (val) {
              setState(() => isColors = val);
            },
          ),
        ],
      ),
    );
  }
}
