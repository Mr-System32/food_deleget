import 'dart:ffi';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:flutter/material.dart';
import 'package:food_deleget/Screen/Customer/AddCustomer.dart';
import 'package:food_deleget/Screen/Login/LoginScreen.dart';
import 'package:food_deleget/Screen/Order/Orders.dart';
import 'package:food_deleget/Screen/Prodect/ProdectDetails.dart';
import 'package:food_deleget/Screen/Prodect/prodect.dart';
import 'package:food_deleget/Screen/Profile/Profile.dart';
import 'package:food_deleget/constants.dart';
import 'package:drawer_swipe/drawer_swipe.dart';

var drawerKey = GlobalKey<SwipeDrawerState>();
int selectedIndex = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  // var drawerKey = GlobalKey<SwipeDrawerState>();

  final _pageOptions = [
    Prodect(),
    Order(),
    AddCustomer(),
    Profile(),
  ];

  Widget buildDrawer() {
    return Container(
        child: SafeArea(
            child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.0),
          Row(
            children: [
              Image.asset(
                "assets/images/u.png",
                scale: 1.5,
              ),
              Column(
                children: [
                  Text(
                    "علي جاسم محمد",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    " AliJassem@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30.0),
          ListTile(
            title: Text(
              'الرئيسية',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.right,
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'الحساب الشخصي',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            selected: true,
            onTap: () {
              setState(() {
                //  txt='List Tile pressed';
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.sentiment_very_dissatisfied_sharp,
              color: Colors.white,
            ),
            title: Text(
              'العروض',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            selected: true,
            onTap: () {
              setState(() {});
            },
          ),
          ListTile(
            leading: Icon(
              Icons.wallet_giftcard_rounded,
              color: Colors.white,
            ),
            title: Text(
              'طلباتي',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            selected: true,
            onTap: () {
              setState(() {
                //  txt='List Tile pressed';
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            title: Text(
              'تواصل معنا',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            selected: true,
            onTap: () {
              setState(() {
                //  txt='List Tile pressed';
              });
            },
          ),
        ],
      ),
    )));
  }

  @override
  Widget buildb() {
    return Scaffold(
      // drawer:  ,
      //  appBar :  AppBar(
      //     title: Text('AppBar title'),
      //     leading: InkWell(
      //         onTap: () {
      //           if (drawerKey.currentState.isOpened()) {
      //             drawerKey.currentState.closeDrawer();
      //           } else {
      //             drawerKey.currentState.openDrawer();
      //           }
      //         },
      //         child: Icon(Icons.menu)),
      //   ),
      body: SafeArea(
        child: Center(
          child: _pageOptions[selectedIndex],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'الصفحة الرئيسية',
            selectedBackgroundColor: kPrimaryColor,
          ),
          FFNavigationBarItem(
            iconData: Icons.shopping_cart_rounded,
            label: 'السلة',
            selectedBackgroundColor: kPrimaryColor,
          ),
          FFNavigationBarItem(
            iconData: Icons.wallet_giftcard_rounded,
            label: 'العروض',
            selectedBackgroundColor: kPrimaryColor,
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'الحساب',
            selectedBackgroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add this line so you can add your appBar in Body
      extendBodyBehindAppBar: true,
      body: SwipeDrawer(
        radius: 20,
        key: drawerKey,
        curve: Curves.easeIn,
        hasClone: true,
        bodyBackgroundPeekSize: 50,
        backgroundColor: kPrimaryColor,
        // pass drawer widget
        drawer: buildDrawer(),
        // pass body widget
        child: buildb(),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text(
                'Side menu  FlutterCorner',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return FloatingNavBar(
//      // cardWidth: 100,
//
//       color:  Color(0xff14279B),
//       selectedIconColor: Colors.white,
//       unselectedIconColor: Colors.white.withOpacity(0.6),
//       items: [
//       //-0  FloatingNavBarItem(iconData: Icons.home_outlined, page: MyHomePage1(), title: 'Home'),
//         FloatingNavBarItem(iconData: Icons.local_hospital_outlined, page: LoginScreen(), title: 'Doctors'),
//         FloatingNavBarItem(iconData: Icons.alarm, page: LoginScreen(), title: 'Reminders'),
//         FloatingNavBarItem(iconData: Icons.pending_actions_outlined, page: LoginScreen(), title: 'Records'),
//       ],
//       horizontalPadding: 5.0,
//       hapticFeedback: false,
//       showTitle: true,
//     ) ;
//   }
// }
