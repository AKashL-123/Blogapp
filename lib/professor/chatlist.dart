import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:untitled/professor/chatscreen.dart';

import '../app_colors.dart';

class chatlist extends StatefulWidget {
  const chatlist({ Key? key }) : super(key: key);

  @override
  State<chatlist> createState() => _chatlistState();
}

class _chatlistState extends State<chatlist> {
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
                builder: (context) => chatroom(username: user, chatroomid: "vjhvufghctycytc", myusername: user),
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