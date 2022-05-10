import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:untitled/app_colors.dart';
import 'package:untitled/professor/add_details.dart';
import 'package:untitled/students/qrcode.dart';

Map<String, List> _elements = {
  'Request For OD Students': ['kavi','shan'],
  'Request For leave Form': ["barani"],
};

class requestpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Requested List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Requested List'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: GroupListView(
          sectionsCount: _elements.keys.toList().length,
          countOfItemInSection: (int section) {
            return _elements.values.toList()[section].length;
          },
          itemBuilder: _itemBuilder,
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                _elements.keys.toList()[section],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Asfan(name: user),
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
}

class Asfan extends StatefulWidget {
  Asfan({this.name});
  var name;
  var what;

  @override
  State<Asfan> createState() => _AsfanState();
}

class _AsfanState extends State<Asfan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Letters"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 30),
            child: Text(
              "Name            :    ${widget.name} \n\nRoll NO         : 2011005\n\nFromDate     : 21.2.2022\n\nToDate          : 23.4.2022\n\nReason         : Requesting to provide on-duty",
              style: TextStyle(fontSize: 18),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 130,right: 190),
          //   child: ElevatedButton(onPressed: null, child: Text("Accept",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 250,bottom: 80),
          //   child: Row(
          //     children: [
          //       ElevatedButton(onPressed: null, child: Text("Deny",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),),
          //     ],
          //   ),
          // )
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text("Accept"),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text("Deny")),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
