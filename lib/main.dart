import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fishingjet_v5/screens/mov_To.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';


import 'provider/my_provider.dart';
import 'screens/homepage.dart';
import 'screens/loginpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
  options: FirebaseOptions(apiKey: "AIzaSyBk-hEzP3WJIf7VXlEdMterOI-RJyzcHEI", appId: "1:956816697076:android:996538ea4c1843e9a8a0a1", messagingSenderId: "956816697076", projectId:"j-checkup")
  );
  runApp(FishingJet());
}