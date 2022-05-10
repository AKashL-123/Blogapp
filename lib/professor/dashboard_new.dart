import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:untitled/professor/add_details.dart';
import 'package:untitled/professor/chatlist.dart';
import 'package:untitled/professor/chatscreen.dart';
import 'package:untitled/professor/dashboardf.dart';

import '../app_colors.dart';

class dashboardnew extends StatefulWidget {
  const dashboardnew({Key? key}) : super(key: key);

  @override
  State<dashboardnew> createState() => _dashboardnewState();
}

class _dashboardnewState extends State<dashboardnew> {
  Map<String, List> _elements = {
    'OD in College': ['Akash', 'Prasath', 'Hari Karthik'],
    'Leave': ["Vishwa"],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
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
                              "Add Student Details",
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
                              "Request Forms",
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
                              "Chat Room",
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
                        builder: (context) => (const adddetails())));

                    break;
                  case 1:
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => requestpage()),
                    );
                    break;

                  case 2:
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => (chatlist())));
                    break;

                  case 3:
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const adddetails()),
                        (route) => false);
                    break;
                }
              }),
        ],
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
    );
  }

  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {},
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
