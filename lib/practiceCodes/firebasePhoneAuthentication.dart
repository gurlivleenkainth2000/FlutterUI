import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthenticationScreen extends StatefulWidget {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  _PhoneAuthenticationScreenState createState() => _PhoneAuthenticationScreenState();
}

class _PhoneAuthenticationScreenState extends State<PhoneAuthenticationScreen> {

  String verification = "", otpEnterd = "123456";
  bool alreadySignIn = false;
  User user;

  signInWithOtp() async {
    await widget._auth.verifyPhoneNumber(
        phoneNumber: "+911234567890",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCredential) {
          print(">>> Auth Credential: " + authCredential.toString());
        },
        verificationFailed: (FirebaseException exception) {
          print(">>> Exception: " + exception.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          verification = verificationId;
          print(">>> Code Sent Verification Id: " + verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          print(">>> Verification Id: " + verificationId);
        },
    );
  }

  getCurrentUser() async {
   return widget._auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    try {
      user = widget._auth.currentUser;
      if(user != null) {
        setState(() {
          alreadySignIn = true;
        });
      } else {
        setState(() {
          alreadySignIn = false;
        });
        signInWithOtp();
      }
    } catch(e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        title: Text(
            'Phone Authentication',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                widget._auth.signOut().then((value) {
                  setState(() {
                    alreadySignIn = !alreadySignIn;
                  });
                });
              }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Phone SignIn',
        onPressed: () async {
          AuthCredential credential = PhoneAuthProvider.credential(verificationId: verification, smsCode: otpEnterd);
          UserCredential userCredential = await widget._auth.signInWithCredential(credential);
          if(userCredential.user != null) {
            // print(">>> Sign In Successful");
            setState(() {
              alreadySignIn = true;
            });
            final snackBar = SnackBar(content: Text('Sign In Successful'));
            widget.scaffoldKey.currentState.showSnackBar(snackBar);
          } else {
            signInWithOtp();
          }
        },
        child: Icon(Icons.account_circle_rounded, size: 32,),
      ),
      body: Center(
        child: Text(
          alreadySignIn ? "Already Sign In" : "Please Sign In",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
