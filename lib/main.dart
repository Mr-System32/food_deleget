

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';


import 'Screen/Home/HomeScreen.dart';

import 'constants.dart';

 Box box;
var Token = "";

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() async {
  // HttpOverrides.global = new MyHttpOverrides();
   WidgetsFlutterBinding.ensureInitialized();
   var dir;
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  box = await Hive.openBox('UserInfo');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.space): ActivateIntent(),
      },
      debugShowCheckedModeBanner: false,

       theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,

        // Define the default font family.
        fontFamily: 'somer',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontFamily: 'somer'),
        //   headline6: TextStyle(fontSize: 36.0, fontFamily: 'somer' ),
        //   bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'somer'),
        // ),
      ),
      // theme: ThemeData(fontFamily: 'Poppins'),
      home: MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    // messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((value) {
    //   setState(() {
    //     Token = value.toString();
    //     if (Token.length > 10) {
    //       UpdateToken(Token, C_BPartner_ID, Session_ID);
    //     }
    //   });
    //
    //   print(value);
    // });

    //  LoadData();
  }

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery
        .of(context)
        .size;

    return Scaffold(

       body :  Directionality(
         textDirection: TextDirection.rtl,
         child: HomeScreen(),
       )
    );
  }
}

// Future<String> UpdateToken(var token, C_BPartner_ID, Session_ID) async {
//   var URL = Url +
//       "UpdateToken?token=" +
//       token +
//       "&C_BPartner_ID=" +
//       C_BPartner_ID +
//       "&Session_ID=" +
//       Session_ID;
//   print("Token Url " + URL);
//   final responseData = await http.get(URL);
//   if (responseData.statusCode == 200) {
//     final data = jsonDecode(responseData.body);
//     print(data);
//     return data.toString();
//   } else {}
// }