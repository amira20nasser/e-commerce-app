import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/settings_screen.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/theme.dart';

final shouldGoToLoginProvider =
    StateNotifierProvider<ShouldGoToLoginNotifier, bool>((ref) {
  return ShouldGoToLoginNotifier();
});

class ShouldGoToLoginNotifier extends StateNotifier<bool> {
  ShouldGoToLoginNotifier() : super(false) {
    _getBoolLogin();
  }

  Future<void> _getBoolLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool('shouldGoToLogin') ?? false;
    state = isLogin;
  }

  void setBoolLogin(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shouldGoToLogin', newValue);
    state = newValue;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("!!!!!!!!!!!${ref.watch(shouldGoToLoginProvider)}");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(isDarkModeProvider)
          ? ThemeManager.shared.getDarkTheme()
          : ThemeManager.shared.getLightTheme(),
      home: ref.watch(shouldGoToLoginProvider)
          ? const LoginScreen()
          : const SplashScreen(),
    );
  }
}
