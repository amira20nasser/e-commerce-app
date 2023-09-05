import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to our e-commerce store!',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "logo",
              ),
            ),
            const SizedBox(height: 10.0),
            Image.asset('assets/images/opening-removebg.png'),
            const SizedBox(height: 10.0),
            const Text(
              'Start shopping now!',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "display",
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Text("Or"),
            ElevatedButton(
              onPressed: googleSignInAction,
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }

  void googleSignInAction() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      FireBaseHelper().signInWithGoogle().then(
        (value) {
          if (value is User) {
            Navigator.pop;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
          } else {
            debugPrint('Sign-in with Google failed.');
          }
        },
      );
    } catch (e) {
      debugPrint('Error signing in with Google: $e');
    }
  }
}
