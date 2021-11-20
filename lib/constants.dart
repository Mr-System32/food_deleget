import 'package:flutter/material.dart';

import 'main.dart';

// All of our constant stuff

const kPrimaryColor = Color(0xFF00AF91);
const ktextColor = Color(0xFF858597);
const kOrangeColor = Color(0xFFF59F1F);
const kgreenColor = Color(0xFFD7F2ED) ;
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);
const kButtonColor = Color(0xFF57C7F6);
const kTextColorr = Color(0xFF515151);
const kToastColorr = Color(0xFFFC7EAD);
const ConfirmColor = Color(0xFF02CE02);
const CancelColor = Color(0xFFFF7C51);
const EndTimeColor = Color(0xFFA2D2FF);
const CompleteColor = Color(0xFF2600BC);
const InprogressColor = Color(0xFF03E1F2);
const Other1Color = Color(0xFF00BDAA);
const PindingColor = Color(0xFFFF9595);
const StartTimeColor = Color(0xFFFFC144);
const ArriveColor = Color(0xFF897BFF);
const kDefaultPadding = 20.0;


// BaghdadSmile_API             Live

// var ImageUrl = "http://192.168.1.4:9001/Images/";
//
// var ImageUrlLocal = "http://192.168.1.4:9001/Images/";
// var ImageUrlWeb = "http://192.168.1.4:9001/Images/";
//
// var ServiceUrl = "http://192.168.1.4:9006/";
// var ServiceUrlLocal = "http://192.168.1.4:9006/";


//BaghdadSmile_API             UAT

// var ImageUrl = "http://185.104.157.19:6078/Images/";
//
// var ImageUrlLocal = "http://192.168.0.14:6078/Images/";
// var ImageUrlWeb = "http://185.104.157.19:6078/Images/";

var ImageUrl = "http://185.104.157.19:6070/Images/";

var ImageUrlLocal = "http://192.168.0.14:6070/Images/";
var ImageUrlWeb = "http://185.104.157.19:6070/Images/";


// var ServiceUrl = "http://185.104.157.19:7082/";
//  var ServiceUrlLocal = "http://192.168.0.14:7082/";
var ServiceUrl = "https://185.104.157.19:6072/";
var ServiceUrlLocal = "https://192.168.0.14:6072/";

//SulDental_API               UAT

// var ImageUrl = "http://185.104.157.19:6079/Images/";
//
// var ImageUrlLocal = "http://192.168.0.14:6079/Images/";
// var ImageUrlWeb = "http://185.104.157.19:6079/Images/";
// var ServiceUrl = "http://185.104.157.19:7083/";
// var ServiceUrlLocal = "http://192.168.0.14:7083/";

var Url = "";
var Session_ID = "";
var AD_User_ID = "";
var Client_ID = "";
var org_ID = "";
var role_ID = "";
var Name = "0";
var Pic = "0";
var Email = "0";
var C_BPartner_ID = "0";
var D_C_BPartner_ID = "0";
var EMPLOYEE_TYPE = "";
var Salary = "0";
var Phone = "0";
var Postion = "0";
var Room = "0";

void LoadData() {
  Session_ID = box.get('Session_ID').toString();
  print("  'Session_ID'  )" + box.get('EMPLOYEE_TYPE').toString());
  Url = box.get('Url');
  ImageUrl = box.get('ImageUrl');
  AD_User_ID = box.get('AD_User_ID');
  Client_ID = box.get('Client_ID');
  org_ID = box.get('org_ID');
  role_ID = box.get('role_ID');
  Name = box.get('Name');
  Pic = box.get('Pic');
  Email = box.get('Email');
  C_BPartner_ID = box.get('C_BPartner_ID');
  EMPLOYEE_TYPE = box.get('EMPLOYEE_TYPE');
  Salary = box.get('Salary');
  Phone = box.get('Phone');
  Postion = box.get('Postion');

  Room = box.get('Room');
}

void SaveData() {
  box.put('AD_User_ID', AD_User_ID);
  box.put('Url', Url);
  box.put('ImageUrl', ImageUrl);
  box.put('Session_ID', Session_ID);
  box.put('role_ID', role_ID);
  box.put('Client_ID', Client_ID);
  box.put('org_ID', org_ID);
  box.put('C_BPartner_ID', C_BPartner_ID);
  box.put('EMPLOYEE_TYPE', EMPLOYEE_TYPE);
  box.put('Name', Name);
  box.put('Pic', Pic);
  box.put('Email', Email);
  box.put('Phone', Phone);
  box.put('Salary', Salary);
  box.put('Postion', Postion);
  box.put('Room', Room);
  print(" AD_User_ID " + box.get('AD_User_ID').toString());
}

void Clear() {
  Url = "";
  Session_ID = "";
  AD_User_ID = "";
  Client_ID = "";
  org_ID = "";
  role_ID = "";
  Name = "";
  Pic = "";
  Email = "";
  C_BPartner_ID = "0";
  EMPLOYEE_TYPE = "";
  Salary = "0";
  Phone = "";
  Postion = "";
  Room = "";
  box.clear();
}
