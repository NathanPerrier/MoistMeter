import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final int selectedIndex; // Add this field to store the selected index

  Navbar({Key? key, required this.selectedIndex}) // Add selectedIndex to the constructor
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedIndex: selectedIndex, // Use the selectedIndex field here
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/map');
              break;
            case 2:
              Navigator.pushNamed(context, '/add');
              break;
            case 3:
              Navigator.pushNamed(context, '/calender');
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
              break;
            default:
              Navigator.pushNamed(context, '/home');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Calender',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}