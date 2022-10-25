

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/otp.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/verify.dart';
// ignore: unused_import
import 'screens/home.dart';
//import 'otp.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(); 
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {'home':(context) => Home(),'otp':(context) => Otp(),'verify':(context) => Verify(),'profile':(context) => Profile()},)
      // title: 'Welcome to Flutter',
      //home: Verify(),
    );
  }
