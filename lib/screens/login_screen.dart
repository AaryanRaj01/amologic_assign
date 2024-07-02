import 'package:amolgic_assignment/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? _user;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      return user;
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.12, 0.3, 0.7, 1.0],
                colors: [
                  Color(0xFF171717),
                  Color(0xFF171717),
                  Color(0xFF19161A),
                  Color(0xFF370340),
                  Color(0xFF171717),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(flex: 2), // Added Spacer to move content down
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Welcome back we missed you',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.0),
                  Text('Username',style: TextStyle(color: Colors.white54,fontSize: 15),),
                  SizedBox(height: 9.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white54),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Text('Password',style: TextStyle(color: Colors.white54,fontSize: 15),),
                  SizedBox(height: 9.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white54),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(Icons.visibility, color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(height: 45.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                        colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login with username and password
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.0,
                          color: Colors.white54,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.0,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          User? user = await signInWithGoogle();
                          if (user != null) {
                            setState(() {
                              _user = user;
                              router.go('/details');
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sign-In Failed')),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 0.3),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Image.asset(
                            'assets/google.png',
                            height: 30.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          // Handle Apple sign-in
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 0.3),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Image.asset(
                            'assets/apple.png',
                            height: 30.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          // Handle Facebook sign-in
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 0.3),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Image.asset(
                            'assets/facebook.png',
                            height: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 1), // Added Spacer to move content down
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
