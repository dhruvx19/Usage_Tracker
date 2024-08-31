import 'dart:io';

import 'package:assignment/providers/websocket_provider.dart';
import 'package:assignment/ui/dashboard/dashboard_page.dart';
import 'package:assignment/ui/login/login_page.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //allows all certificates
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ChangeNotifierProvider(
      create: (context) => WebSocketProvider(),
      child: const MyApp(),
    ),
  );

//to configure properties of windows 
  doWhenWindowReady(() {
    appWindow.alignment = Alignment.center;
    appWindow.minSize = const Size(800, 800);
    appWindow.size = const Size(800, 800);
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // removes debug banner
      debugShowCheckedModeBanner: false,
      title: 'Wi-Jungle Dashboard',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashBoardPage(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  //for development purposes only (allows all certificates)
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}
