import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/app/bloc/auth/user_auth_bloc.dart';
import 'package:flutter_template/app/pages/auth/social_page.dart';
import 'package:flutter_template/app/pages/settings/language_settings.dart';
import 'package:flutter_template/injection_container.dart' as DI;
import 'package:core/theme/config.dart';
import 'package:core/theme/custom_theme.dart';
import 'package:flutter_template/notification/notification_manager.dart';

import 'generated/l10n.dart';

void main() async {
  // To initialize the the dependency injection
  await DI.initLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAuthBloc>(
      create: (context) => DI.instance<UserAuthBloc>(),
      child: MaterialApp(
        title: 'Template',
        home: MyHomePage(
          title: 'Flutter template',
        ),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
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
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    NotificationManager().init().then(
        (value) => {NotificationManager().listenFirebaseMessage(context)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You have pushed the button this many times:",
            ),
            Text(
              '$_counter',
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
                currentTheme.toggleTheme();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
