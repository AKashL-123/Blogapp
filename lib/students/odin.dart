import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/professor/loginf.dart';
import 'package:untitled/students/Semesterdetails.dart';
import 'package:untitled/students/qrcode.dart';

class odin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          PopupMenuButton(

              icon: const Icon(Icons.more_vert_outlined,color: Colors.black,),
              color: Colors.grey, //don't specify icon if you want 3 dot menu
              // color: Colors.red,
              shape: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1)),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Semester Details",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Other Details",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.restore,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Attendence Details",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    PopupMenuItem<int>(
                        value: 3,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ],
              onSelected: (item) async {
                switch (item) {
                  case 0:
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => (const Semester())));

                    break;
                  case 1:
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Semester()),
                    );
                    break;

                  case 3:
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Semester()),
                        (route) => false);
                    break;
                }
              }),
        ],
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Student Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset("assets/prasath.jfif"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Prasath",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Roll No : 2011031",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        title: Text("Dept : AI and DS",
                            style: const TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text("Batch : 2021-2022",
                            style: const TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text("number : 8883527876",
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                  margin: const EdgeInsets.all(20),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 1)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
