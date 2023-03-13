import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/my_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  const SignUp({super.key});
  
  
  
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  bool loading=false;
  late UserCredential userCredential;
  RegExp regExp = RegExp(SignUp.pattern.toString());
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();


  Future sendData() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user!.uid)
          .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential.user!.uid,
        "password": password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const snackBar=SnackBar(content: Text("The password provided is too weak"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // notificationBar(text: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        const snackBar=SnackBar(content: Text("The account already exist for that email"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // notificationBar(text: "The account already exist for that email");
      }
    } catch (e) {
        // const snackBar=SnackBar(content: Text(e));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString(),),));
      // notificationBar(text: (e));
      setState(() {
        loading=false;
      });
    }
      setState(() {
        loading=false;
      });
  }


  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
        const snackBar=SnackBar(content: Text("First Name is Empty"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // notificationBar(text: "First Name is Empty");
      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
        const snackBar=SnackBar(content: Text("Last name is Empty"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // notificationBar(text: "Last name is empty");
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
        const snackBar=SnackBar(content: Text("Email is empty"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // notificationBar(text: "Email is empty");
      return;
    } else if (!regExp.hasMatch(email.text)) {
        const snackBar=SnackBar(content: Text("Please enter the valid email ID"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //  notificationBar(text: "Please enter valid Email ID");
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
        const snackBar=SnackBar(content: Text("Password field is Empty"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // notificationBar(text: "Password is Empty");
      return;
    } else {
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

  Widget button(
      {required String buttonName,
      required Color color,
      required Color textColor,
      required void Function() ontap}) {
    return Container(
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
        onPressed: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: firstName,
                      obscureText: false,
                      hintText: 'fistName',
                    ),
                    MyTextField(
                      controller: lastName,
                      obscureText: false,
                      hintText: 'lastName',
                    ),
                    MyTextField(
                      controller: email,
                      obscureText: false,
                      hintText: 'Email',
                    ),
                    MyTextField(
                      controller: password,
                      obscureText: true,
                      hintText: 'password',
                    )
                  ],
                ),
              ),
             loading?Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                CircularProgressIndicator(),
               ],
             )
             :
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    ontap: () {},
                    buttonName: "Canel",
                    color: Colors.grey,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  button(
                    ontap: () {
                      validation();
                    },
                    buttonName: "Register",
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}