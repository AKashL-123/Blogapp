import 'package:blog/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_home';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  AssetImage image;
  Animation animation;
  bool loading = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    image = AssetImage("images/Texting.gif");
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
  }

  Future<void> signup(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      setState(() {
        loading = true;
      });
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        UserCredential result = await auth.signInWithCredential(authCredential);
        User user = result.user;
        setState(() {
          loading = false;
        });
        if (result != null) {
          Fluttertoast.showToast(
            msg: "Login Successfull",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homescreen()));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    image.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: animation.value,
        body: ModalProgressHUD(
            inAsyncCall: loading,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlickerAnimatedTextKit(
                        repeatForever: true,
                        text: ['MLSA COMMUNITY'],
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: image)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: MaterialButton(
                      color: Colors.purpleAccent,
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/google.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sign in with google",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Montserrat'),
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          signup(context);
                        });
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
