import 'package:dental_proj/screens/history_screen.dart';

import 'package:dental_proj/screens/home_screen.dart';
import 'package:dental_proj/screens/profile_screen.dart';
import 'package:dental_proj/screens/teeth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../models/patient_model.dart';
import '../services/database_service.dart';

final box = GetStorage();

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 0;
  getUserFunction() async {
    final userData = await SupabaseService().fetchUserData();

    setState(() {});

    final patietobj = Patient.fromJson(userData);
    box.write("patient", patietobj);
  }

  void _navigatorFunction(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserFunction();
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const TeethScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xff003253),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _navigatorFunction,
            gap: 8,
            color: const Color(0xffc6edfa),
            activeColor: const Color(0xffc6edfa),
            // navigation bar padding
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.local_hospital,
                text: 'Teeth',
              ),
              GButton(
                icon: Icons.list_rounded,
                text: 'History',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ]),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
