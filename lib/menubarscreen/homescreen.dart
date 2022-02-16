import 'package:blog/homepage.dart';
import 'package:blog/service/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:blog/service/slider.dart';

Widget homescreen1() {
  return ListView( 


      children: <Widget>[


        SizedBox(height: 15.0),

        CarouselSlider(
          options: CarouselOptions(


          height: 180.0,


          enlargeCenterPage: true,


          autoPlay: true,


          aspectRatio: 16 / 9,


          autoPlayCurve: Curves.fastOutSlowIn,


          enableInfiniteScroll: true,


          autoPlayAnimationDuration: Duration(milliseconds: 800),


          viewportFraction: 0.8,),


          items: [


            Container(


              margin: EdgeInsets.all(5.0),


              decoration: BoxDecoration(


                borderRadius: BorderRadius.circular(10.0),


                image: DecorationImage(


                  image: AssetImage('assets/ck.jpg'),


                  fit: BoxFit.cover,


                ),


              ),


              child: Column(


                mainAxisAlignment: MainAxisAlignment.center,


                crossAxisAlignment: CrossAxisAlignment.center,


                children: <Widget>[


                  Text(


                    'Usable Flower for Health',


                    style: TextStyle(


                      color: Colors.white,


                      fontWeight: FontWeight.bold,


                      fontSize: 18.0,


                    ),


                  ),



                  Padding(


                    padding: const EdgeInsets.all(15.0),


                    child: Text(


                      'Lorem Ipsum is simply dummy text use for printing and type script',


                      style: TextStyle(


                        color: Colors.white,


                        fontSize: 15.0,


                      ),


                      textAlign: TextAlign.center,


                    ),


                  ),


                ],


              ),


            ),



            Container(


              margin: EdgeInsets.all(5.0),


              decoration: BoxDecoration(


                borderRadius: BorderRadius.circular(10.0),


                image: DecorationImage(


                  image: AssetImage('assets/bk.jpg'),


                  fit: BoxFit.cover,


                ),


              ),


              child: Column(


                mainAxisAlignment: MainAxisAlignment.center,


                crossAxisAlignment: CrossAxisAlignment.center,


                children: <Widget>[


                  Text(


                    'Usable Flower for Health',


                    style: TextStyle(


                      color: Colors.white,


                      fontWeight: FontWeight.bold,


                      fontSize: 18.0,


                    ),


                  ),



                  Padding(


                    padding: const EdgeInsets.all(15.0),


                    child: Text(


                      'Lorem Ipsum is simply dummy text use for printing and type script',


                      style: TextStyle(


                        color: Colors.white,


                        fontSize: 15.0,


                      ),


                      textAlign: TextAlign.center,


                    ),


                  ),


                ],


              ),


            ),



            Container(


              margin: EdgeInsets.all(5.0),


              decoration: BoxDecoration(


                borderRadius: BorderRadius.circular(10.0),


                image: DecorationImage(


                  image: AssetImage('assets/drawer.jpg'),


                  fit: BoxFit.cover,


                ),


              ),


              child: Column(


                mainAxisAlignment: MainAxisAlignment.center,


                crossAxisAlignment: CrossAxisAlignment.center,


                children: <Widget>[


                  Text(


                    'Usable Flower for Health',


                    style: TextStyle(


                      color: Colors.white,


                      fontWeight: FontWeight.bold,


                      fontSize: 18.0,


                    ),


                  ),



                  Padding(


                    padding: const EdgeInsets.all(15.0),


                    child: Text(


                      'Lorem Ipsum is simply dummy text use for printing and type script',


                      style: TextStyle(


                        color: Colors.white,


                        fontSize: 15.0,


                      ),


                      textAlign: TextAlign.center,


                    ),


                  ),


                ],


              ),


            ),


          ],


        ),


      ],


    );

  //   debugShowCheckedModeBanner: false,
  //   title: 'Testing',
  //   home: new Scaffold(
  //     //Here you can set what ever background color you need.
  //     backgroundColor: Colors.orange[50],
  //     body: Column(
  //       children: [
  //         Center(
  //           child: new RichText(
  //               text: TextSpan(children: <TextSpan>[
  //             TextSpan(
  //                 text: "homescreen", style: TextStyle(color: Colors.black))
  //           ])),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
