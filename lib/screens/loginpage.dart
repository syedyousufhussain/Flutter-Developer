import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signuppage.dart';
import 'widgets/my_text_field.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loadding = false;
  RegExp regExp = RegExp(LoginPage.pattern.toString(),);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  UserCredential ?userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       const snackBar=SnackBar(
        content: Text("No user found for that email"),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);}
        // globalKey.currentState.showSnackBar
        //   SnackBar(
        //     content: Text('No user found for that email.'),
          
       
       else if (e.code == 'wrong-password') {
        const snackBar=SnackBar(content: Text("Wrong Password provided"),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        
        setState(() {
          loadding = false;
        });
      }
      setState(() {
        loadding = false;
      });
    }
  }

  void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
          const snackBar=SnackBar(content: Text("All Fields are empty"),);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      const snackBar=SnackBar(content: Text("Email is empty"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (!regExp.hasMatch(email.text)) {
      const snackBar=SnackBar(content: Text("Please Enter Valid Email ID"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      const snackBar=SnackBar(content: Text("Password is Empty"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      setState(() {
        loadding = true;
      });
      loginAuth();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon:Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: Text(
                "Login In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                  controller: email,
                  obscureText: false,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: password,
                  obscureText: true,
                  hintText: 'Password',
                ),
              ],
            ),
            loadding
                ? CircularProgressIndicator():
                Container(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom( 
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          ),
                          ),
                      onPressed: () {
                        validation();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 60,
                    width: 600,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom( 
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          ),
                          ),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()
                        ),
                        );
                      },
                      child: const Text(
                        "New User? | Register Now",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "New user?",
            //       style: TextStyle(color: Colors.grey),
            //     ),
            //     Text(
            //       "Register now.",
            //       style: TextStyle(color: Colors.red),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
