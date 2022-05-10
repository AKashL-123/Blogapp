import 'package:flutter/material.dart';
import 'package:untitled/professor/loginf.dart';
import 'package:untitled/students/odin.dart';
import 'package:untitled/students/odout.dart';
import 'package:untitled/students/leave.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
    ),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Center(
            child: Column(
              children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: new MaterialButton(
                          height: 100.0,
                          minWidth: 150.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: new Text("Student Details"),

                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => odin()),
                            );
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: new MaterialButton(
                          height: 100.0,
                          minWidth: 150.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: new Text("OD Form"),

                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => odout()),
                            );
                          },
                        )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: new MaterialButton(
                      height: 100.0,
                      minWidth: 150.0,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: new Text("Leave Form"),

                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => leave()),
                        );
                      },
                    )),
              ],
            ),
        ),
      ),
    );
  }
}
