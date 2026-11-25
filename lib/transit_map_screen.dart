
import 'package:btsystem/settings_page.dart';
import 'package:btsystem/watch_list_page.dart';
import 'package:flutter/material.dart';

import 'console_page.dart';
import 'map_page.dart';

class TransitMapScreen extends StatefulWidget {
  const TransitMapScreen({super.key});

  @override
  State<TransitMapScreen> createState() => _TransitMapScreenState();
}

class _TransitMapScreenState extends State<TransitMapScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages =  [
    MapPage(),
    WatchListPage(),
    SettingsPage(),
    ConsolePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF131D24),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00E676),
        unselectedItemColor: Colors.white70,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined), label: 'Watchlist'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.radar_outlined), label: 'Console'),
        ],
      ),
    );
  }
}
