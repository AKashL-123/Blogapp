import 'package:flutter/material.dart';

Widget homescreen1() {
  
      return new MaterialApp(
        debugShowCheckedModeBanner:false,

        
        title: 'Testing',
        home: new Scaffold(
        //Here you can set what ever background color you need.
          backgroundColor: Colors.orange[50],
          body: Column(
            children: [
              
              Center(
                child: new RichText(text: TextSpan(children: <TextSpan>[TextSpan(text: "homescreen",style: TextStyle(color:Colors.black))])) ,),
            ],
          ),
          
        ),
      );
    

  
}
