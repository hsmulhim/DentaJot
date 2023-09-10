import 'dart:async';
import 'package:dental_proj/screens/profile_screen.dart';
import 'package:dental_proj/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool canGoHome = false;
  StreamSubscription? listen;

  @override
  void initState() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        canGoHome = true;
        setState(() {});
      }

      if (event == AuthChangeEvent.signedOut) {
        canGoHome = false;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: canGoHome ? const ProfileScreen() : const SignInScreen(),
        ),
      ),
    );
  }
}
