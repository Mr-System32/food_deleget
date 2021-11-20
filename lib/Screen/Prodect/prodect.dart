import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deleget/Screen/Home/HomeScreen.dart';
import 'package:food_deleget/constants.dart';

import 'ProdectDetails.dart';

class Prodect extends StatefulWidget {
  @override
  _ProdectState createState() => _ProdectState();
}

class Data {
  Map fetched_data = {
    "data": [
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": " 1200 د ",
        "description":
            "يحتوي نصف كوب أي ما يعادل 100 جرام من الفاصوليا البيضاء",
        "image": "assets/images/r.png"
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": " 1200 د ",
        "description":
            "يحتوي نصف كوب أي ما يعادل 100 جرام من الفاصوليا البيضاء",
        "image": "assets/images/u.png"
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": " 1200 د ",
        "description":
            "يحتوي نصف كوب أي ما يعادل 100 جرام من الفاصوليا البيضاء",
        "image": "assets/images/r.png"
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": " 1200 د ",
        "description":
            "يحتوي نصف كوب أي ما يعادل 100 جرام من الفاصوليا البيضاء",
        "image": "assets/images/r.png"
      },
    ]
  };
  List _data;

//function to fetch the data

  Data() {
    _data = fetched_data["data"];
  }

  int getId(int index) {
    return _data[index]["id"];
  }

  String getName(int index) {
    return _data[index]["name"];
  }

  String getPrice(int index) {
    return _data[index]["price"];
  }

  String getDescription(int index) {
    return _data[index]["description"];
  }

  String getIamge(int index) {
    return _data[index]["image"];
  }

  int getLength() {
    return _data.length;
  }
}

class _ProdectState extends State<Prodect> {
  Data _data = new Data();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ///Search Bar

                Container(
                  //  margin: EdgeInsets.all(15),
                  padding:
                      EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
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
                      ),
                      Expanded(
                        child: TextField(
                          cursorColor: kPrimaryColor,
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 0.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 0.0),
                              ),
                              fillColor: kgreenColor,
                              filled: true,
                              helperStyle: TextStyle(color: kPrimaryColor),
                              counterStyle: TextStyle(color: kPrimaryColor),
                              focusColor: kPrimaryColor,
                              hintStyle:
                                  TextStyle(color: kPrimaryColor, fontSize: 20),
                              hintText: 'بحث',
                              prefixIcon: Icon(
                                Icons.search,
                                color: kPrimaryColor,
                                size: 24,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.filter_list,
                                  color: kPrimaryColor,
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
                        flex: 100,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                //   padding: const EdgeInsets.all(8.0),
                //   // Another fixed-height child.
                //   // color: const Color(0xff008000), // Green
                //   // height: 1000.0,
                //   child:Column(
                //   //  mainAxisSize: MainAxisSize.max,
                //     children:   [
                //
                //     TextField(
                //
                //         cursorColor: kPrimaryColor,
                //         style: TextStyle(fontSize: 24, color: kPrimaryColor),
                //         decoration: InputDecoration(
                //             enabledBorder: UnderlineInputBorder(
                //               borderSide:   BorderSide(
                //                   color: kPrimaryColor, width: 0.0),
                //             ),
                //             focusedBorder:   UnderlineInputBorder(
                //               borderSide:   BorderSide(
                //                   color: kPrimaryColor, width: 0.0),
                //             ),
                //             fillColor: kgreenColor   ,
                //             filled: true,
                //             helperStyle: TextStyle(color: kPrimaryColor),
                //             counterStyle: TextStyle(color: kPrimaryColor),
                //             focusColor: kPrimaryColor,
                //             hintStyle:
                //             TextStyle(color: kPrimaryColor, fontSize: 25),
                //             hintText: 'بحث',
                //             prefixIcon: Icon(
                //               Icons.search,
                //               color: kPrimaryColor,
                //             ),
                //             suffixIcon: Icon(
                //               Icons.filter_list,
                //               color: kPrimaryColor,
                //             )),
                //       ),
                //     // IconButton(  icon: const Icon(Icons.menu),),
                //
                //   ],)
                //
                //
                // ),

                /// Discount item
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.all(8.0),
                  // Another fixed-height child.
                  // color: const Color(0xff008000), // Green
                  // height: 1000.0,
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: Text("الخصومات",
                              style: TextStyle(
                                  color: ktextColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))),
                      Container(
                          height: 180.0,
                          // width: 150,
                          child: DiscountCartList())
                    ],
                  ),
                ),

                ///All Item
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(8.0),
                  // Another fixed-height child.
                  // color: const Color(0xff008000), // Green
                  // height: 1000.0,
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: Text("المواد الغذائية",
                              style: TextStyle(
                                  color: ktextColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))),
                      createCartList()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  createCartList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem(position);
      },
      itemCount: _data.getLength(),
    );
  }

  createCartListItem(int position) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // Route route =
            // MaterialPageRoute(builder: (context) => ProdectDetails());
            // Navigator.pushReplacement(context, route);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: ProdectDetails(),
                    )));

            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(5))),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            _data.getName(position),
                            maxLines: 2,
                            softWrap: true,
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            _data.getDescription(position),
                            style: const TextStyle(
                                color: ktextColor, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 100,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            right: 8, left: 8, top: 8, bottom: 8),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(_data.getIamge(position)))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, right: 8, left: 8),
                        color: kPrimaryColor.withAlpha(25),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          _data.getPrice(position),
                          style: const TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DiscountCartList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: _data.getLength(),
        // itemExtent: 10.0,
        // reverse: true, //makes the list appear in descending order
        itemBuilder: (BuildContext context, int index) {
          return _buildItems(index);
        });
  }

  Widget _buildItems(int position) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            print(position);
          },
          child: Container(
            padding:
                const EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
            width: 150,
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("50%",
                        style: TextStyle(
                            color: kOrangeColor,
                            fontSize: 30,
                            fontWeight: FontWeight.normal))),

                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(_data.getIamge(position)))),
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 2, right: 8, left: 8),
                      color: kOrangeColor.withAlpha(25),
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _data.getPrice(position),
                            style: TextStyle(color: kOrangeColor),
                          ),
                          const Icon(
                            Icons.all_inbox,
                            color: kOrangeColor,
                          ),
                        ],
                      )),
                )
                //
                //       // Padding(
                //       //   padding: const EdgeInsets.all(8.0),
                //       //   child: Row(
                //       //     mainAxisAlignment: MainAxisAlignment.center,
                //       //     crossAxisAlignment: CrossAxisAlignment.end,
                //       //     children: <Widget>[
                //       //       Icon(
                //       //         Icons.remove,
                //       //         size: 24,
                //       //         color: Colors.grey.shade700,
                //       //       ),
                //             Container(
                //               color: Colors.grey.shade200,
                //               // padding: const EdgeInsets.only(
                //               //     bottom: 2, right: 12, left: 12),
                //               child: Text(
                //                 "1",
                //
                //               ),
                //             ),
                //       //       Icon(
                //       //         Icons.add,
                //       //         size: 24,
                //       //         color: Colors.grey.shade700,
                //       //       )
                //       //     ],
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        // IgnorePointer(ignoring:true,child:Container(
        //
        //   padding: const EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
        //   width: 150,
        //   margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //         color: Colors.black12,
        //         width: 1,
        //       ),
        //       color: Colors.white,
        //       borderRadius: const BorderRadius.all(Radius.circular(5))),
        //
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       const Align(
        //           alignment: Alignment.centerLeft,
        //           child: Text("50%",
        //               style: TextStyle(
        //                   color: kOrangeColor,
        //                   fontSize: 30,
        //                   fontWeight: FontWeight.normal))),
        //
        //       Container(
        //         margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
        //         width: 80,
        //         height: 80,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.all(Radius.circular(14)),
        //             color: Colors.white,
        //             image: DecorationImage(
        //                 image: AssetImage(_data.getIamge(position)))),
        //       ),
        //
        //       Align(
        //         alignment: Alignment.bottomLeft,
        //         child: Container(
        //             padding: const EdgeInsets.only(
        //                 top: 2, bottom: 2, right: 8, left: 8),
        //             color: kOrangeColor.withAlpha(25),
        //             margin: EdgeInsets.only(bottom: 8),
        //             child: Row(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Text(
        //                   _data.getPrice(position),
        //                   style: TextStyle(color: kOrangeColor),
        //                 ),
        //                 const Icon(
        //                   Icons.all_inbox,
        //                   color: kOrangeColor,
        //                 ),
        //               ],
        //             )),
        //       )
        //       //
        //       //       // Padding(
        //       //       //   padding: const EdgeInsets.all(8.0),
        //       //       //   child: Row(
        //       //       //     mainAxisAlignment: MainAxisAlignment.center,
        //       //       //     crossAxisAlignment: CrossAxisAlignment.end,
        //       //       //     children: <Widget>[
        //       //       //       Icon(
        //       //       //         Icons.remove,
        //       //       //         size: 24,
        //       //       //         color: Colors.grey.shade700,
        //       //       //       ),
        //       //             Container(
        //       //               color: Colors.grey.shade200,
        //       //               // padding: const EdgeInsets.only(
        //       //               //     bottom: 2, right: 12, left: 12),
        //       //               child: Text(
        //       //                 "1",
        //       //
        //       //               ),
        //       //             ),
        //       //       //       Icon(
        //       //       //         Icons.add,
        //       //       //         size: 24,
        //       //       //         color: Colors.grey.shade700,
        //       //       //       )
        //       //       //     ],
        //       //       //   ),
        //       //       // )
        //       //     ],
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),),
      ],
    );
  }
}
