import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fishingjet_v5/screens/mov_To.dart';
import 'package:flutter/cupertino.dart';
// import 'package:fishingjet_v5/screens/homepage.dart';
// import 'package:fishingjet_v5/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
// import 'package:splashscreen/splashscreen.dart';

import 'provider/my_provider.dart';
import 'screens/homepage.dart';
import 'screens/loginpage.dart';
// import 'screens/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
  options: FirebaseOptions(apiKey: "AIzaSyBk-hEzP3WJIf7VXlEdMterOI-RJyzcHEI", appId: "1:956816697076:android:996538ea4c1843e9a8a0a1", messagingSenderId: "956816697076", projectId:"j-checkup")
  );
  runApp(FishingJet());
}
// FlutterNativeSplash.remove();
 
// class SplashScreenPage extends StatelessWidget {  
//   @override  
//   Widget build(BuildContext context) {  
//     return MaterialLocalizations(
       
//         seconds: 5,  
//         navigateAfterSeconds: new LoginPage(),  
//         backgroundColor: Colors.yellow,  
//         title: new Text('Flutter Javatpoint',textScaleFactor: 2,),  
//         image: new Image.network(  
//             'https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png'  
//         ),  
//         loadingText: Text("Loading"),  
//         photoSize: 150.0,  
//         loaderColor: Colors.red,  
//       ),
//     );  
//   }  
// }  

// class FishingJet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MyProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           scaffoldBackgroundColor: Color(0xff2b2b2b),
//           appBarTheme: AppBarTheme(
//             color: Color(0xff2b2b2b),
//           ),
//         ),
//         // home: WelcomePage(),
//         home: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (index, sncpshot) {
//               if (sncpshot.hasData) {
//                 return HomePage();
//               }
//               return LoginPage();
//             }),
//       )
//       );  
//   }
// }
// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   // const WelcomePage({super.key});
//   @override

//   void initState(){
//     super.initState();
//     Timer(Duration(seconds: 5),(){
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>FishingJet()));
//     }
//     );
//   }

//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 child: Center(
//                   child: Image.asset('images/logo.jpg'),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       "Welcome To Tastee",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Order food form our restaueant and\n Make reservation in real- time",
//                         style: TextStyle(
//                           fontSize: 16
//                         ),),
//                         // Text("Make reservation in real- time")
//                       ],
//                     ),
//                     // button(name: 'Login', color: Colors.green,textColor: Colors.white),
//                     // button(name: 'SignUp', color: Colors.white,textColor: Colors.green),
//                   ],
//                 ),
//               ),
//             )
        
//         ],
//         ),
//       ),
//     );
//   }
// }
