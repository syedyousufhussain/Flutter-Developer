import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';
import 'homepage.dart';
import 'loginpage.dart';

class FishingJet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2b2b2b),
          appBarTheme: AppBarTheme(
            color: Color(0xff2b2b2b),
          ),
        ),
        // home: WelcomePage(),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (index, sncpshot) {
              if (sncpshot.hasData) {
                return HomePage();
              }
              return LoginPage();
            }),
      )
      );  
  }
}