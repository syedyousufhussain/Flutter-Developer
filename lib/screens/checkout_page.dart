import "package:flutter/material.dart";

import 'cart_page.dart';

class check_Out extends StatefulWidget {
  const check_Out({super.key});

  @override
  State<check_Out> createState() => _check_OutState();
}

class _check_OutState extends State<check_Out> {
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
        ),
      ),
      body:Center(
        child:
        
        Text("Thanks for making reservation from Fish Corner \n\nEnjoy Your Meal",style: TextStyle(color: Colors.white,fontSize: 20,),textAlign: TextAlign.center,
        ),
      ),
    );
  }
}