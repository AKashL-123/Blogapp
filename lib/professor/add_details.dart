import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

import '../app_colors.dart';

class adddetails extends StatefulWidget {
  const adddetails({Key? key}) : super(key: key);

  @override
  State<adddetails> createState() => _adddetailsState();
}

class _adddetailsState extends State<adddetails> {
  final Map<String, List> _elements = {
    'Students List': [
      'Akash',
      'HariKarthik',
      'Prasath',
      'Raghul',
      'Aatheesh',
      "Ashwin",
      "Barani",
      "Bharath",
      "Dharmesh",
      "Dinesh",
      'Rogan'
    ]
  };
  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => details(
                  name: user,
                ),
              ));
        },
        child: Card(
          elevation: 8,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
            leading: CircleAvatar(
              child: Text(
                _getInitials(user),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              backgroundColor: _getAvatarColor(user),
            ),
            title: Text(
              _elements.values.toList()[index.section][index.index],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }

  String _getInitials(String user) {
    var buffer = StringBuffer();
    var split = user.split(" ");
    for (var s in split) buffer.write(s[0]);

    return buffer.toString().substring(0, split.length);
  }

  Color _getAvatarColor(String user) {
    return AppColors
        .avatarColors[user.hashCode % AppColors.avatarColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GroupListView(
        sectionsCount: _elements.keys.toList().length,
        countOfItemInSection: (int section) {
          return _elements.values.toList()[section].length;
        },
        itemBuilder: _itemBuilder,
        groupHeaderBuilder: (BuildContext context, int section) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Center(
              child: Text(
                _elements.keys.toList()[section],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
      ),
    );
  }
}

class details extends StatelessWidget {
  var name;
  details({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Center(
                  child: Text(
                "Upload $name Marks",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              )),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Semester1,
                          //     ));
                        },
                        child: Container(
                          height: 100,
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
                      height: 100,
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
                        height: 100,
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
                      height: 100,
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
                        height: 100,
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
                      height: 100,
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
                        height: 100,
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
                      height: 100,
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
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 100,
                      width: 200,
                      child: Card(
                        child: ListTile(
                          title: Center(child: Text("Other Details")),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(20),
                      ),
                    ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
