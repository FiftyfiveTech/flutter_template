import 'package:flutter/material.dart';
import 'package:flutter_template/component/radio_group.dart';
import 'package:flutter_template/generated/intl/messages_all.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:intl/intl.dart';

class LanguageSettings extends StatefulWidget {
  static const String routeName = '/language_settings';

  @override
  State<StatefulWidget> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  List<String> supportedLanguages = ["English", "Swedish"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).choose_language,
                  style: TextStyle(fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RadioGroup(supportedLanguages, (value) {
                    if (value.toLowerCase() == "english") {
                      changeToLocale("en");
                    } else if (value.toLowerCase() == "swedish") {
                      changeToLocale("sv");
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeToLocale(String localeCode) {
    String localeName = Intl.canonicalizedLocale(localeCode);
    initializeMessages(localeName)
        .then((value) => {Intl.defaultLocale = localeName});
    setState(() {});
  }
}
