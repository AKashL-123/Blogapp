import 'package:flutter/material.dart';

class Semester extends StatefulWidget {
  const Semester({Key? key}) : super(key: key);

  @override
  State<Semester> createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Semester Details",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
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
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Semester1(),
                            ));
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Card(
                          child: ListTile(
                            title: Text("Semester 1"),
                          ),
                          elevation: 8,
                          shadowColor: Colors.green,
                          margin: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 200,
                    width: 200,
                    child: Card(
                      child: ListTile(
                        title: Text("Semester 2"),
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Card(
                        child: ListTile(
                          title: Text("Semester 3"),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 200,
                    width: 200,
                    child: Card(
                      child: ListTile(
                        title: Text("Semester 4"),
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Card(
                        child: ListTile(
                          title: Text("Semester 5"),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 200,
                    width: 200,
                    child: Card(
                      child: ListTile(
                        title: Text("Semester 6"),
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Card(
                        child: ListTile(
                          title: Text("Semester 7"),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 200,
                    width: 200,
                    child: Card(
                      child: ListTile(
                        title: Text("Semester 8"),
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ));
  }
}

class Semester1 extends StatelessWidget {
  const Semester1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Semester 1",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
      body: Card(
        child: Column(
          children: [
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text(
                "Data Analytics ",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Android Programming :",
                  style: const TextStyle(fontSize: 20)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Embedded System : ",
                  style: const TextStyle(fontSize: 20)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Machine learning :",
                  style: const TextStyle(fontSize: 20)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Cloud Computing :",
                  style: const TextStyle(fontSize: 20)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Software Enginering :",
                  style: const TextStyle(fontSize: 20)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Programming With Python :",
                  style: const TextStyle(fontSize: 20)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Pass", style: const TextStyle(fontSize: 20)),
              ),
              title: Text("Simulation Laboratory:",
                  style: const TextStyle(fontSize: 20)),
            ),
            Divider(
              thickness: 5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "CGPA : 8.1",
                    style: TextStyle(fontSize: 15),
                  )),
                  Expanded(
                      child: Text("GPA : 8.1", style: TextStyle(fontSize: 15))),
                  Expanded(
                      child:
                          Text("Result : Pass", style: TextStyle(fontSize: 15)))
                ],
              ),
            )
          ],
        ),
        elevation: 8,
        shadowColor: Colors.green,
        margin: const EdgeInsets.all(20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 1)),
      ),
    );
  }
}
