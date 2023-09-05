import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../providers/user_data.dart';

final isDarkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>((ref) {
  return DarkModeNotifier();
});

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false) {
    _loadIsDarkMode();
  }

  Future<void> _loadIsDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    state = prefs.getBool('isDarkMode${UserData().id}') ?? false;
  }

  void toggleDarkMode(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode${UserData().id}', newValue);
    state = newValue;
  }
}

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.only(top: 40),
      children: [
        buildSettingOption(
          icon: Icons.support,
          title: 'Support',
          onPressed: () {},
        ),
        buildSettingOption(
          icon: Icons.info,
          title: 'About',
          onPressed: () {},
        ),
        buildSettingOption(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          onPressed: () {},
          switchWidget: Switch(
            value: ref.watch(isDarkModeProvider),
            onChanged: (newMode) {
              ref.read(isDarkModeProvider.notifier).toggleDarkMode(newMode);
            },
          ),
        ),
        buildSettingOption(
          icon: Icons.language,
          title: 'Languages',
          onPressed: () {},
        ),
        buildSettingOption(
          icon: Icons.logout,
          title: 'Log out',
          onPressed: () async {
            ref.read(shouldGoToLoginProvider.notifier).setBoolLogin(true);
            await FireBaseHelper().signOut().then((value) {
              return Navigator.of(context, rootNavigator: true)..pop();
            });
          },
        ),
      ],
    );
  }

  Widget buildSettingOption({
    required VoidCallback onPressed,
    required IconData icon,
    required String title,
    Widget? switchWidget,
  }) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      trailing: switchWidget ?? const Icon(Icons.arrow_forward_ios),
    );
  }
}
