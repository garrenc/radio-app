import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perm_fm/screens/tabs_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const MaterialColor swatchColor = const MaterialColor(
    0xff28adbe, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff28adbe), //10%
      100: const Color(0xff28adbe), //20%
      200: const Color(0xff28adbe), //30%
      300: const Color(0xff28adbe), //40%
      400: const Color(0xff28adbe), //50%
      500: const Color(0xff28adbe), //60%
      600: const Color(0xff28adbe), //70%
      700: const Color(0xff28adbe), //80%
      800: const Color(0xff28adbe), //90%
      900: const Color(0xff28adbe), //100%
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => TabsScreen(
              1,
              'Радио России',
              'https://icecast-bulteam.cdnvideo.ru/russia128',
              'assets/images/russia.png',
              '+73422820554',
              'radiorus.ru@yandex.ru',
              'https://vk.com/radiorussia1',
              'https://t.me/radiorossii',
              'radiorus.ru',
              'г. Пермь, ул. Техническая, 7',
              false),
        ),
      ),
    );
    return MaterialApp(
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: true, textScaleFactor: 1.0),
          child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: swatchColor,
        primaryColor: Color(0xff28adbe),
        fontFamily: 'Lato',
      ),
      home: TabsScreen(
          1,
          'Радио России',
          'https://icecast-bulteam.cdnvideo.ru/russia128',
          'assets/images/russia.png',
          '+73422820554',
          'radiorus.ru@yandex.ru',
          'https://vk.com/radiorussia1',
          'https://t.me/radiorossii',
          'radiorus.ru',
          'г. Пермь, ул. Техническая, 7',
          false),
      routes: {
        '/player': (context) => TabsScreen(
            0,
            'Радио России',
            'https://icecast-bulteam.cdnvideo.ru/russia128',
            'assets/images/russia.png',
            '+73422820554',
            'radiorus.ru@yandex.ru',
            'https://vk.com/radiorussia1',
            'https://t.me/radiorossii',
            'radiorus.ru',
            'г. Пермь, ул. Техническая, 7',
            false),
      },
    );
  }
}
