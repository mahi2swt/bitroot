import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/modules/dashboard/ui/screens/dashboard_screen.dart';
import 'package:bitroot_org/modules/screens/scan_screen.dart';
import 'package:bitroot_org/modules/screens/send_and_request_screen.dart';
import 'package:bitroot_org/modules/settings/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  Widget getScreen() {
    switch (_selectedIndex.value) {
      case 0:
        return const DashboardScreen();

      case 1:
        return const ScanScreen();

      case 2:
        return const SendAndRequestScreen();

      case 3:
        return const SettingScreen();

      default:
        return const DashboardScreen();
    }
  }

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsBase.white,
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return Center(
            child: getScreen(),
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'Scan Receipt',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payments),
                label: 'Send & Request',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Settings',
              ),
            ],
            backgroundColor: ColorsBase.white,
            currentIndex: _selectedIndex.value,
            selectedItemColor: ColorsBase.blue,
            unselectedItemColor: ColorsBase.gray,
            selectedFontSize: 12,
            elevation: 5,
            onTap: _onItemTapped,
          );
        },
      ),
    );
  }
}
