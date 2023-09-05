import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorText;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/images/LoginImage-removebg.png',
                      width: 180,
                      height: 180,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Sign in your account',
                      style: TextStyle(
                        color: Color.fromARGB(220, 158, 158, 158),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return errorText;
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        filled: true,
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 158, 158),
                            width: 1.0,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return errorText;
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: pass,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: !pass
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              pass = !pass;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 158, 158),
                            width: 1.0,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(text: "Login", onTapAction: signInAction),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Text("Or"),
              ElevatedButton(
                onPressed: googleSignInAction,
                child: const Text('Sign in with Google'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 58),
                child: Row(
                  children: [
                    const Text(
                      "Don't have account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "display",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 157, 114, 16),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInAction() async {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      FireBaseHelper()
          .signIn(emailController.text.toString(),
              passwordController.text.toString())
          .then((value) {
        if (value is User) {
          passwordController.text = "";
          emailController.text = "";
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else if (value is String) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
        }
      });
    }
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
