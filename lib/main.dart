import 'package:dental_proj/auth/app.dart';
import 'package:dental_proj/screens/first_screen.dart';
import 'package:dental_proj/screens/my_report_screen.dart';
import 'package:dental_proj/screens/teeth_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://mguwylgfdatsdadqsffy.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ndXd5bGdmZGF0c2RhZHFzZmZ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMzODA4ODgsImV4cCI6MjAwODk1Njg4OH0.InTs-O2OiTGEUoyvGZKNESQCJvxGOLx6NavNB5o93WY",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyReportScreen(),
    );
  }
}
