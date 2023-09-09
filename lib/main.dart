import 'package:dental_proj/screens/home_screen.dart';
import 'package:dental_proj/screens/theeth_screen.dart';
import 'package:dental_proj/services/supabase.dart';
import 'package:flutter/material.dart';

void main() {
  supabaseCon();
  runApp(TeethScreen());
}

class TeethScreen extends StatelessWidget {
  const TeethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (TheethScreen()),
    );
  }
}
