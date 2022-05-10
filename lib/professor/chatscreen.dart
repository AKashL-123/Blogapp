import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:untitled/professor/circlebutton.dart';

class chatroom extends StatefulWidget {
  final String username;
  var imageurl;

  final String myusername;
  final String chatroomid;
  chatroom(
      {required this.username,
      this.imageurl,
      required this.chatroomid,
      required this.myusername});

  @override
  _chatroomState createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  final chatcontroller = TextEditingController();
  var imageurl;
  // final ImagePicker imagePicker = ImagePicker();
  // var crop;
  // profileimage pi = profileimage();
  // var _image;
  // fcstore fc = fcstore();
  String messagetext = "";
  @override
  void initState() {
    // convertimage();

    super.initState();
  }

  // convertimage() {
  //   setState(() {
  //     String _imgString = widget.imageurl;

  //     imageurl = Base64Decoder().convert(_imgString);
  //   });
  // }

  // sendmessage() async {
  //   String base64string;
  //   if (chatcontroller.text.isNotEmpty && widget.myusername.isNotEmpty) {
  //     Map<String, dynamic> messagemap = {
  //       "message": chatcontroller.text,
  //       "sender": widget.myusername,
  //       'timestamp': FieldValue.serverTimestamp(),
  //       'image': pi.getimage()[9],
  //       'imagechecker': false,
  //     };
  //     fc.createConversionmessage(widget.chatroomid, messagemap);
  //   }
  // }

  // Future getimage() async {
  //   var _bytesImage;
  //   XFile image = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (image != null) {
  //     File cropped = await ImageCropper().cropImage(
  //         sourcePath: image.path,
  //         aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  //         compressQuality: 100,
  //         compressFormat: ImageCompressFormat.jpg,
  //         androidUiSettings: AndroidUiSettings(
  //             toolbarColor: Colors.lightBlueAccent,
  //             toolbarTitle: "Cropper",
  //             statusBarColor: Colors.deepOrange[900],
  //             backgroundColor: Colors.white));
  //     setState(() {
  //       if (cropped != null) {
  //         crop = cropped;
  //         _image = cropped.path;
  //         print(_image);
  //         Navigator.push(
  //             this.context,
  //             MaterialPageRoute(
  //                 builder: (context) => imagesender(
  //                       image: _image,
  //                       myusername: widget.myusername,
  //                       chatroomid: widget.chatroomid,
  //                     )));
  //       }
  //     });
  //   }
  //   // Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(widget.username,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),
                  ),
                  // CircleAvatar(
                  //   backgroundImage: widget.imageurl == null
                  //       ? AssetImage("assets/user.png")
                  //       : Image.memory(imageurl).image,
                  //   radius: 20,
                  // )
                ],
              ),
            ),
            // messagestream(
            //   chatroomid: widget.chatroomid,
            //   myusername: widget.myusername,
            // ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 10, left: 15),
                    child: TextFormField(
                        onChanged: (value) {
                          messagetext = value;
                        },
                        controller: chatcontroller,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: CircleIconButton(
                            onPressed: () {
                              chatcontroller.clear();
                            },
                            icon: Icons.camera_alt,
                          ),
                          fillColor: Colors.grey,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: SizedBox(
                    height: 58,
                    width: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // sendmessage();
                          chatcontroller.clear();
                        });
                      },
                      child: Icon(Icons.send),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                        primary: Colors.grey,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

// class messagestream extends StatelessWidget {
//   messagestream({this.chatroomid, this.myusername});
//   final String chatroomid;
//   final String myusername;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection("chatroom")
//           .doc(chatroomid)
//           .collection("chats")
//           .orderBy("timestamp", descending: false)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//               child: CircularProgressIndicator(
//             backgroundColor: Colors.blueAccent,
//           ));
//         }
//         final messages = snapshot.data.docs.reversed;
//         List<Messagebuble> TW = [];
//         for (var message in messages) {
//           final mmessagetext = message.data()['message'];
//           final sender = message.data()['sender'];
//           final image = message.data()['image'];
//           final imagechecker = message.data()['imagechecker'];
//           print(myusername);
//           final user = myusername;

//           final messagebuble = Messagebuble(
//               messagetext: mmessagetext,
//               sender: sender,
//               image: image,
//               userme: user == sender ? true : false,
//               imagecheck: imagechecker);
//           TW.add(messagebuble);
//         }
//         return Expanded(
//             child: ListView(
//           shrinkWrap: true,
//           reverse: true,
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           children: TW,
//         ));
//       },
//     );
//   }
// }

// class Messagebuble extends StatelessWidget {
//   Messagebuble(
//       {this.messagetext,
//       this.sender,
//       this.userme,
//       this.image,
//       this.imagecheck});
//   final String messagetext;
//   final String sender;
//   bool userme;
//   var image;
//   bool imagecheck;
//   convert con = convert();
//   @override
//   Widget build(BuildContext context) {
//     return imagecheck != true
//         ? Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//             child: Column(
//               crossAxisAlignment: userme == true
//                   ? CrossAxisAlignment.end
//                   : CrossAxisAlignment.start,
//               children: [
//                 Material(
//                   elevation: 5,
//                   borderRadius: BorderRadius.only(
//                       topLeft: userme == true
//                           ? Radius.circular(30)
//                           : Radius.circular(0),
//                       topRight: userme == true
//                           ? Radius.circular(0)
//                           : Radius.circular(30),
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30)),
//                   color: userme == true ? Color(0xff7067df) : Color(0xff424657),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     child: Text(
//                       "${messagetext}",
//                       style: TextStyle(fontSize: 15, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => imageview(
//                             image: con.decodeimage(image),
//                           )));
//             },
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: Column(
//                 crossAxisAlignment: userme == true
//                     ? CrossAxisAlignment.end
//                     : CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.yellow[100],
//                         border: Border.all(
//                           width: 7,
//                           color: userme == true
//                               ? Color(0xff7067df)
//                               : Color(0xff424657),
//                         )),
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     child: Image(
//                         image: Image.memory(con.decodeimage(image)).image),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     child: Text(
//                       messagetext ?? " ",
//                       style: TextStyle(
//                           fontSize: 15,
//                           color:
//                               userme == true ? Colors.white : Colors.black54),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//   }
// }
