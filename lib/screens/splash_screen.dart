import 'package:flutter/material.dart';
import '../app.dart';
import 'package:go_router/go_router.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delayed navigation function
    void navigateToLogin() {
      Future.delayed(Duration(seconds: 3), () {
        router.go('/login');
      });
    }

    // Call navigateToLogin when widget is first built
    WidgetsBinding.instance!.addPostFrameCallback((_) => navigateToLogin());

    return Scaffold(
      backgroundColor: Color(0xFF818AF9),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/healthypet.png'),
                      SizedBox(width: 5),
                      const Text(
                        'healthypet',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFDFE2FF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                const Text(
                  'Helping you ',
                  style: TextStyle(fontSize: 25, color: Color(0xFFDFE2FF)),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'to keep',
                        style: TextStyle(color: Color(0xFFDFE2FF)),
                      ),
                      TextSpan(
                        text: ' your bestie',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'stay healthy!',
                  style: TextStyle(fontSize: 25, color: Color(0xFFDFE2FF)),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Image.asset(
            'assets/dog.png',
            width: MediaQuery.of(context).size.width, // Match screen width
            fit: BoxFit.cover, // Adjust image to cover the width
          ),
        ],
      ),
    );
  }
}
