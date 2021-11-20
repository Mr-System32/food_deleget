import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_pin_picker/map_pin_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_deleget/Screen/Home/HomeScreen.dart';
import '../../constants.dart';
import 'package:geolocator/geolocator.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key  key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {

  Completer<GoogleMapController> _controller = Completer();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(31.2060916, 29.9187),
    zoom: 14.4746,
  );

  Address address;

  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MapPicker(
              // pass icon widget
              iconWidget: Icon(
                Icons.location_pin,
                size: 50,
              ),
              //add map picker controller
              mapPickerController: mapPickerController,
              child: GoogleMap(

                initialCameraPosition:
                CameraPosition(target: LatLng(-34.397, 150.644)),
             //   onMapCreated: _onMapCreated,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                compassEnabled: true,
                rotateGesturesEnabled: true,
                mapToolbarEnabled: true,
                tiltGesturesEnabled: true,
                gestureRecognizers: < Factory < OneSequenceGestureRecognizer >> [
                  new Factory < OneSequenceGestureRecognizer > (
                        () => new EagerGestureRecognizer(),
                  ),
                ].toSet(),


                // hide location button
            //    myLocationButtonEnabled: false,
                 mapType: MapType.normal,
                //  camera position
                // initialCameraPosition: cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMoveStarted: () {
                  // notify map is moving
                  mapPickerController.mapMoving();
                },
                onCameraMove: (cameraPosition) {
                  this.cameraPosition = cameraPosition;
                },
                onCameraIdle: () async {
                  // notify map stopped moving
                  mapPickerController.mapFinishedMoving();
                  //get address name from camera position
                  List<Address> addresses = await Geocoder.local
                      .findAddressesFromCoordinates(Coordinates(
                      cameraPosition.target.latitude,
                      cameraPosition.target.longitude));
                  // update the ui with the address
                  textController.text = '${addresses.first?.addressLine ?? ''}';
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          color: Colors.blue,
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero, border: InputBorder.none),
            controller: textController,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          // icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: SingleChildScrollView(
  //         child: Container(
  //           margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   IconButton(
  //                     icon: const Icon(
  //                       Icons.menu,
  //                       color: kPrimaryColor,
  //                       size: 30,
  //                     ),
  //                     onPressed: () {
  //
  //                       // if (drawerKey.currentState.isOpened()) {
  //                       //   drawerKey.currentState.closeDrawer();
  //                       // } else {
  //                       //   drawerKey.currentState.openDrawer();
  //                       // }
  //                     },
  //                   ),
  //                   IconButton(
  //                     icon: const Icon(
  //                       Icons.arrow_forward_outlined,
  //                       color: kPrimaryColor,
  //                       size: 30,
  //                     ),
  //                     onPressed: () {
  //                       if (drawerKey.currentState.isOpened()) {
  //                         drawerKey.currentState.closeDrawer();
  //                       } else {
  //                         drawerKey.currentState.openDrawer();
  //                       }
  //                     },
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
  //                 width: 100,
  //                 height: 100,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.all(Radius.circular(14)),
  //                     color: Colors.transparent,
  //                     image: DecorationImage(
  //                         image: AssetImage("assets/images/u.png"),
  //                         fit: BoxFit.fill)),
  //               ),
  //               Container(
  //                   margin: const EdgeInsets.only(
  //                       right: 10, left: 10, top: 10, bottom: 10),
  //                   child: Column(children: const [
  //                     TextField(
  //
  //                       cursorColor: ktextColor,
  //                       style: TextStyle(fontSize: 24, color: ktextColor),
  //                       decoration: InputDecoration(
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           // fillColor: kgreenColor,ktextColor
  //                           // filled: true,
  //                           helperStyle: TextStyle(color: ktextColor),
  //                           counterStyle: TextStyle(color: ktextColor),
  //                           focusColor: ktextColor,
  //                           hintStyle:
  //                           TextStyle(color: ktextColor, fontSize: 20),
  //                           hintText: 'الأسم',
  //                           suffixIcon: IconButton(
  //                             icon: Icon(
  //                               Icons.person,
  //                               color: ktextColor,
  //                             ),
  //                             //                     onPressed: () {
  //                             //   if (drawerKey.currentState.isOpened()) {
  //                             //     drawerKey.currentState.closeDrawer();
  //                             //   } else {
  //                             //     drawerKey.currentState.openDrawer();
  //                             //   }
  //                             // },
  //                           )),
  //                     ),
  //                     SizedBox(height: 10,),
  //                     TextField(
  //
  //                       cursorColor: ktextColor,
  //                       style: TextStyle(fontSize: 24, color: ktextColor),
  //                       decoration: InputDecoration(
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           // fillColor: kgreenColor,ktextColor
  //                           // filled: true,
  //                           helperStyle: TextStyle(color: ktextColor),
  //                           counterStyle: TextStyle(color: ktextColor),
  //                           focusColor: ktextColor,
  //                           hintStyle:
  //                           TextStyle(color: ktextColor, fontSize: 20),
  //                           hintText: 'البريد الألكتروني',
  //                           suffixIcon: IconButton(
  //                             icon: Icon(
  //                               Icons.mail,
  //                               color: ktextColor,
  //                             ),
  //                             //                     onPressed: () {
  //                             //   if (drawerKey.currentState.isOpened()) {
  //                             //     drawerKey.currentState.closeDrawer();
  //                             //   } else {
  //                             //     drawerKey.currentState.openDrawer();
  //                             //   }
  //                             // },
  //                           )),
  //                     ),
  //                     SizedBox(height: 10,),
  //
  //                     TextField(
  //
  //                       cursorColor: ktextColor,
  //                       style: TextStyle(fontSize: 24, color: ktextColor),
  //                       decoration: InputDecoration(
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           // fillColor: kgreenColor,ktextColor
  //                           // filled: true,
  //                           helperStyle: TextStyle(color: ktextColor),
  //                           counterStyle: TextStyle(color: ktextColor),
  //                           focusColor: ktextColor,
  //                           hintStyle:
  //                           TextStyle(color: ktextColor, fontSize: 20),
  //                           hintText: 'رقم الهاتف',
  //                           suffixIcon: IconButton(
  //                             icon: Icon(
  //                               Icons.phone,
  //                               color: ktextColor,
  //                             ),
  //                             //                     onPressed: () {
  //                             //   if (drawerKey.currentState.isOpened()) {
  //                             //     drawerKey.currentState.closeDrawer();
  //                             //   } else {
  //                             //     drawerKey.currentState.openDrawer();
  //                             //   }
  //                             // },
  //                           )),
  //                     ),
  //                     SizedBox(height: 10,),
  //
  //                     TextField(
  //
  //                       cursorColor: ktextColor,
  //                       style: TextStyle(fontSize: 24, color: ktextColor),
  //                       decoration: InputDecoration(
  //                           enabledBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide:
  //                             BorderSide(color: ktextColor, width: 0.0),
  //                           ),
  //                           // fillColor: kgreenColor,ktextColor
  //                           // filled: true,
  //                           helperStyle: TextStyle(color: ktextColor),
  //                           counterStyle: TextStyle(color: ktextColor),
  //                           focusColor: ktextColor,
  //                           hintStyle:
  //                           TextStyle(color: ktextColor, fontSize: 20),
  //                           hintText: 'العنوان',
  //                           suffixIcon: IconButton(
  //                             icon: Icon(
  //                               Icons.location_on_rounded,
  //                               color: ktextColor,
  //                             ),
  //                             //                     onPressed: () {
  //                             //   if (drawerKey.currentState.isOpened()) {
  //                             //     drawerKey.currentState.closeDrawer();
  //                             //   } else {
  //                             //     drawerKey.currentState.openDrawer();
  //                             //   }
  //                             // },
  //                           )),
  //                     ),
  //                   ])),
  //
  //               SizedBox(height: 20,),
  //               Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 padding: const EdgeInsets.symmetric(vertical: 20),
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                   borderRadius:
  //                   BorderRadius.all(const Radius.circular(5)),
  //                   boxShadow: <BoxShadow>[
  //                     BoxShadow(
  //                         color: Colors.grey.shade200,
  //                         offset: Offset(2, 4),
  //                         blurRadius: 5,
  //                         spreadRadius: 2)
  //                   ],
  //                   gradient: const LinearGradient(
  //                     begin: Alignment.centerLeft,
  //                     end: Alignment.centerRight,
  //                     colors: [
  //                       kPrimaryColor,
  //                       kPrimaryColor,
  //                     ],
  //                   ),
  //                 ),
  //                 child: const Text(
  //                   'تأكيد الطلب',
  //                   style: TextStyle(fontSize: 20, color: Colors.white),
  //                 ),
  //               ),
  //
  //
  //           // bottomNavigationBar: BottomAppBar(
  //           //   color: Colors.transparent,
  //           //   elevation: 0,
  //           //   child: Container(
  //           //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
  //           //     color: Colors.blue,
  //           //     child: TextFormField(
  //           //       readOnly: true,
  //           //       decoration: InputDecoration(
  //           //           contentPadding: EdgeInsets.zero, border: InputBorder.none),
  //           //       controller: textController,
  //           //       style: TextStyle(fontSize: 12, color: Colors.white),
  //           //     ),
  //           //     // icon: Icon(Icons.directions_boat),
  //           //   ),
  //           // ),
  //
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  }


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}