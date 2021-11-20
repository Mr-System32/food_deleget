import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deleget/Screen/Home/HomeScreen.dart';
import 'package:food_deleget/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (drawerKey.currentState.isOpened()) {
                          drawerKey.currentState.closeDrawer();
                        } else {
                          drawerKey.currentState.openDrawer();
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (drawerKey.currentState.isOpened()) {
                          drawerKey.currentState.closeDrawer();
                        } else {
                          drawerKey.currentState.openDrawer();
                        }
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/u.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                    margin: EdgeInsets.only(
                        right: 10, left: 10, top: 10, bottom: 10),
                    child: Column(children: [
                      TextField(
                        readOnly: true,
                        cursorColor: ktextColor,
                        style: TextStyle(fontSize: 24, color: ktextColor),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            // fillColor: kgreenColor,ktextColor
                            // filled: true,
                            helperStyle: TextStyle(color: ktextColor),
                            counterStyle: TextStyle(color: ktextColor),
                            focusColor: ktextColor,
                            hintStyle:
                                TextStyle(color: ktextColor, fontSize: 20),
                            hintText: 'الأسم',
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.person,
                                color: ktextColor,
                              ),
                              //                     onPressed: () {
                              //   if (drawerKey.currentState.isOpened()) {
                              //     drawerKey.currentState.closeDrawer();
                              //   } else {
                              //     drawerKey.currentState.openDrawer();
                              //   }
                              // },
                            )),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        readOnly: true,
                        cursorColor: ktextColor,
                        style: TextStyle(fontSize: 24, color: ktextColor),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            // fillColor: kgreenColor,ktextColor
                            // filled: true,
                            helperStyle: TextStyle(color: ktextColor),
                            counterStyle: TextStyle(color: ktextColor),
                            focusColor: ktextColor,
                            hintStyle:
                                TextStyle(color: ktextColor, fontSize: 20),
                            hintText: 'البريد الألكتروني',
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.mail,
                                color: ktextColor,
                              ),
                              //                     onPressed: () {
                              //   if (drawerKey.currentState.isOpened()) {
                              //     drawerKey.currentState.closeDrawer();
                              //   } else {
                              //     drawerKey.currentState.openDrawer();
                              //   }
                              // },
                            )),
                      ),
                      SizedBox(height: 10,),

                      TextField(
                        readOnly: true,
                        cursorColor: ktextColor,
                        style: TextStyle(fontSize: 24, color: ktextColor),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            // fillColor: kgreenColor,ktextColor
                            // filled: true,
                            helperStyle: TextStyle(color: ktextColor),
                            counterStyle: TextStyle(color: ktextColor),
                            focusColor: ktextColor,
                            hintStyle:
                                TextStyle(color: ktextColor, fontSize: 20),
                            hintText: 'رقم الهاتف',
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.phone,
                                color: ktextColor,
                              ),
                              //                     onPressed: () {
                              //   if (drawerKey.currentState.isOpened()) {
                              //     drawerKey.currentState.closeDrawer();
                              //   } else {
                              //     drawerKey.currentState.openDrawer();
                              //   }
                              // },
                            )),
                      ),
                      SizedBox(height: 10,),

                      TextField(
                        readOnly: true,
                        cursorColor: ktextColor,
                        style: TextStyle(fontSize: 24, color: ktextColor),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ktextColor, width: 0.0),
                            ),
                            // fillColor: kgreenColor,ktextColor
                            // filled: true,
                            helperStyle: TextStyle(color: ktextColor),
                            counterStyle: TextStyle(color: ktextColor),
                            focusColor: ktextColor,
                            hintStyle:
                                TextStyle(color: ktextColor, fontSize: 20),
                            hintText: 'العنوان',
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.location_on_rounded,
                                color: ktextColor,
                              ),
                              //                     onPressed: () {
                              //   if (drawerKey.currentState.isOpened()) {
                              //     drawerKey.currentState.closeDrawer();
                              //   } else {
                              //     drawerKey.currentState.openDrawer();
                              //   }
                              // },
                            )),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
