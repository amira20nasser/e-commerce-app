import 'package:ecommerce/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    debugPrint("splash");
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 254, 254),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SplashBackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  "assets/animations/SplashScreenAnimation.json",
                ),
                const Text(
                  "Swift Shop,Smart Buy",
                  style: TextStyle(
                    fontFamily: "logo",
                    fontSize: 20,
                  ),
                ),
                LottieBuilder.asset(
                  "assets/animations/Welcome.json",
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
