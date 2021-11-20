import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants.dart';

class LoginScreen extends StatefulWidget {
//  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
    //  height: height,
      child: Stack(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          // Positioned(
          //   top: -MediaQuery.of(context).size.height * .15,
          //   right: -MediaQuery.of(context).size.width * .4,
          //   child: Container(
          //       child: Transform.rotate(
          //         angle: -pi / 3.5,
          //         child: ClipPath(
          //           clipper: ClipPainter(),
          //           child: Container(
          //             height: MediaQuery.of(context).size.height * .5,
          //             width: MediaQuery.of(context).size.width,
          //             decoration: const BoxDecoration(
          //               gradient: LinearGradient(
          //                 begin: Alignment.topCenter,
          //                 end: Alignment.bottomCenter,
          //                 colors: [
          //                   Color(0xffE6E6E6),
          //                   Color(0xff14279B),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       )),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height:100),
                  Image.asset('assets/images/loginimage.png',width:300  ,
                      fit: BoxFit.fill),
                  const SizedBox(height: 20),
                  // SizedBox(height: height * .2),
                  //  RichText(
                  //    textAlign: TextAlign.center,
                  //    text: const TextSpan(
                  //        text: 'As.',
                  //        style: TextStyle(
                  //          fontSize: 30,
                  //          fontWeight: FontWeight.w700,
                  //          color: Color(0xff14279B),
                  //        ),
                  //        children: [
                  //          TextSpan(
                  //            text: 'solutions',
                  //            style: TextStyle(color: Colors.black, fontSize: 30),
                  //          ),
                  //        ]),
                  //  ),
                  //  const SizedBox(height: 50),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "البريد الألكتروني",
                              style: TextStyle(
                                  color: ktextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                                cursorColor:kPrimaryColor ,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 20),
                                obscureText: false,
                                decoration: InputDecoration(
                                  focusColor: kPrimaryColor ,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: kPrimaryColor, width: 1)),
                                    border: OutlineInputBorder(

                                        borderSide: BorderSide(
                                            color: kPrimaryColor, width: 0)),
                                    fillColor: Color(0x0fffffff),
                                    filled: true))
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:   <Widget>[
                            Text(
                              "كلمة السر",
                              style: TextStyle(
                                  color: ktextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                           const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              cursorColor:kPrimaryColor ,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 20),
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: kPrimaryColor, width: 1)),
                                    suffixIcon: IconButton(
                                        color: kPrimaryColor,
                                        icon: Icon(_isHidden
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isHidden = !_isHidden;
                                          });
                                        }),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 0)),
                                    fillColor: Color(0x0fffffff),
                                    filled: true))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    // onTap: () => Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeScreen(),
                    //   ),
                    // ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            kPrimaryColor,
                            kPrimaryColor,
                          ],
                        ),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   alignment: Alignment.centerRight,
                  //   child: const Text('Forgot Password ?',
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.w500)),
                  // ),
                  SizedBox(height: height * .055),
                  InkWell(
                    onTap: () {
                      //   Navigator.push(
                      //     //  context,
                      //      // MaterialPageRoute(builder: (BuildContext context) {  }
                      //          // builder: (context) => SignUpScreen()
                      //      // ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.bottomCenter,
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const <Widget>[
                      //     Text(
                      //       'Don\'t have an account ?',
                      //       style: TextStyle(
                      //           fontSize: 13, fontWeight: FontWeight.w600),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       'Register',
                      //       style: TextStyle(
                      //           color: Color(0xff14279B),
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 40,
          //   left: 0,
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     // child: Container(
          //     //   padding: EdgeInsets.symmetric(horizontal: 10),
          //     //   child: Row(
          //     //     children: <Widget>[
          //     //       Container(
          //     //         padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
          //     //         child:
          //     //         Icon(Icons.keyboard_arrow_left, color: Colors.black),
          //     //       ),
          //     //       Text('Back',
          //     //           style: TextStyle(
          //     //               fontSize: 12, fontWeight: FontWeight.w500))
          //     //     ],
          //     //   ),
          //     // ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
