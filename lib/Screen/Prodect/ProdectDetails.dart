import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_deleget/Screen/Home/HomeScreen.dart';

import '../../constants.dart';

class ProdectDetails extends StatefulWidget {
  @override
  _StateProdectDetails createState() => _StateProdectDetails();
}

class _StateProdectDetails extends State<ProdectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(
        child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.menu,
                      //     color: kPrimaryColor,
                      //     size: 30,
                      //   ),
                      //   onPressed: () {
                      //     if (drawerKey.currentState.isOpened()) {
                      //       drawerKey.currentState.closeDrawer();
                      //     } else {
                      //       drawerKey.currentState.openDrawer();
                      //     }
                      //   },
                      // ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_outlined,
                          color: kPrimaryColor,
                          size: 30,
                        ),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            SystemNavigator.pop();
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
                            image: AssetImage("assets/images/r.png"),
                            fit: BoxFit.fill)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "فاصوليا بالاندا اليابسة ",
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, right: 8, left: 20),
                        color: kPrimaryColor.withAlpha(25),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "2000 د",
                          style: const TextStyle(color: kPrimaryColor, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 0, top: 10, bottom: 10),
                    child: Text(
                      " يحتوي نصف كوب أي ما يعادل 100 جرام من الفاصوليا البيضاء",
                      style: const TextStyle(color: ktextColor, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField<int>(
                      //value: _ratingController,

                      items: [1, 2, 3, 4, 5]
                          .map((label) => DropdownMenuItem(
                        child: Text(label.toString()),
                        value: label,
                      ))
                          .toList(),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor, width: 1)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 0)),
                          fillColor: Color(0x0fffffff),
                          filled: true),
                      hint: Text('اختر النوع'),
                      onChanged: (value) {
                        setState(() {
                          //  _ratingController = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: kOrangeColor,
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
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        //  color: kPrimaryColor.withAlpha(25),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "0",
                          style: const TextStyle(color: ktextColor, fontSize: 28),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconButton(
                          icon: Icon(
                            Icons.minimize_sharp,
                            color: kOrangeColor,
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(const Radius.circular(5)),
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
                      'إضافة الى السلة ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
        ),
      )
    );
  }
}
