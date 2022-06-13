import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/locale.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: SettingsList(
          // backgroundColor: backgroundColor,
          sections: [
            SettingsSection(
              title: const Text('Common'),
              tiles: [
                SettingsTile(
                  title: const Text('Language'),
                  description: const Text('English'),
                  leading: const Icon(Icons.language),
                  onPressed: (BuildContext context) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('Language'),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                context
                                    .read<LanguageProvider>()
                                    .setlocale('en');

                                Navigator.pop(context);
                              },
                              child: const Text('English'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                context
                                    .read<LanguageProvider>()
                                    .setlocale('ar');

                                Navigator.pop(context);
                              },
                              child: const Text('Arabic'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SettingsSection(
              title: const Text('Account'),
              tiles: [
                SettingsTile(
                  title: const Text('Email'),
                  leading: const Icon(Icons.mail),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: const Text('Password'),
                  leading: const Icon(Icons.password),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: const Text('Signout'),
                  leading: const Icon(Icons.logout),
                  onPressed: (BuildContext context) async {
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    _prefs.remove('user_type');
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
