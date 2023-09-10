import 'package:dental_proj/screens/appointmets_screen.dart';
import 'package:dental_proj/screens/home_screen.dart';
import 'package:dental_proj/screens/profile_screen.dart';
import 'package:dental_proj/screens/teeth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 0;

  void _navigatorFunction(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const TeethScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _navigatorFunction,
            gap: 8,
            color: const Color(0xff003253),
            activeColor: const Color(0xff076fe0),
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
