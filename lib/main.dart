import 'dart:developer';

import 'package:core/theme/config.dart';
import 'package:core/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/pages/auth/social_page.dart';
import 'package:flutter_template/app/pages/settings/language_settings.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);
final appThemeStateNotifier = ChangeNotifierProvider((ref) => CustomTheme());

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp(
      title: "BoilerPlate",
      home: const HomePage(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: appThemeState.currentTheme,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SocialPage.routeName:
            return MaterialPageRoute(builder: (context) {
              return SocialPage();
            });

          case LanguageSettings.routeName:
            return MaterialPageRoute(builder: (context) {
              return LanguageSettings();
            });
          default:
            return null;
        }
      },
      localizationsDelegates: [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('sv', 'SV'),
      ],
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You have pushed the button this many times:",
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              child: Text("Social SignIn"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SocialPage.routeName,
                );
              },
            ),
            TextButton(
              child: Text("Language Settings"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  LanguageSettings.routeName,
                );
              },
            ),
            TextButton(
              child: Text("Switch Theme"),
              onPressed: () {
                ref.read(appThemeStateNotifier.notifier).toggleTheme();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
