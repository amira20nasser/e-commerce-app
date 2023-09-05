// import 'package:ecommerce/screens/home_page2.dart';
// import 'package:ecommerce/widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   TextEditingController emailController = TextEditingController();

//   bool pass = true;

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 60,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Form(
//                 // key: ValueKey('formKey'),
//                 key: formKey,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: InputDecoration(
//                         filled: true,
//                         hintText: 'Username',
//                         prefixIcon: Icon(Icons.person),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 158, 158, 158),
//                             width: 1.0,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter name ";
//                         }
//                       },
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         hintText: 'Email',
//                         prefixIcon: Icon(Icons.email),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 158, 158, 158),
//                             width: 1.0,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter Email ";
//                         }
//                       },
//                     ),
//                     SizedBox(height: 30),
//                     TextFormField(
//                       obscureText: pass,
//                       decoration: InputDecoration(
//                         filled: true,
//                         hintText: 'Password',
//                         prefixIcon: Icon(Icons.password),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.remove_red_eye_outlined),
//                           onPressed: () {
//                             setState(() {
//                               pass = !pass;
//                             });
//                           },
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 158, 158, 158),
//                             width: 1.0,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter Password ";
//                         }
//                       },
//                     ),
//                     SizedBox(height: 30),
//                     TextFormField(
//                       obscureText: pass,
//                       decoration: InputDecoration(
//                         filled: true,
//                         hintText: 'Confirm Password',
//                         prefixIcon: Icon(Icons.password),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.remove_red_eye_outlined),
//                           onPressed: () {
//                             setState(() {
//                               pass = !pass;
//                             });
//                           },
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 158, 158, 158),
//                             width: 1.0,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 1.0,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter Password ";
//                         }
//                       },
//                     ),
//                     SizedBox(height: 90),
//                     MaterialButton(
//                         elevation: 5.0,
//                         color: Colors.black,
//                         padding:
//                             EdgeInsets.symmetric(vertical: 20, horizontal: 80),
//                         child: Text('Sign Up Now',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             )),
//                         shape: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(50),
//                             borderSide: BorderSide.none),
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             Navigator.pushReplacement(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return HomePage2();
//                             }));
//                           }
//                         }),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool pass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              Center(
                child: Column(children: [
                  const Text(
                    'Sign Up Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Image.asset(
                    "assets/images/SignupImage.jpg",
                    fit: BoxFit.fill,
                    height: 300,
                  ),
                ]),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                          textController: userNameController,
                          hintText: "username",
                          errorText: " Please enter your name ",
                          icons: Icons.person),
                      CustomTextFormField(
                          textController: emailController,
                          hintText: "email",
                          errorText: " Please enter your email ",
                          icons: Icons.mail),
                      CustomTextFormField(
                          textController: passwordController,
                          obscureText: pass,
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
                          hintText: "password",
                          errorText: " Please enter your password ",
                          icons: Icons.lock),
                      CustomButton(text: "Sign Up", onTapAction: signUpAction),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  //ToDosignUpAction

  void signUpAction() async {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      FireBaseHelper()
          .signUp(
              emailController.text.toString(),
              passwordController.text.toString(),
              userNameController.text.toString())
          .then((value) {
        if (value is User) {
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
}
