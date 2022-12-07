import 'package:flutter/material.dart';
import 'screens/courses/courses_screen.dart';
import 'screens/my_tasks/my_tasks_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import './controllers/tab_manager.dart';

// 1
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  //int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const Courses(),
    const MyTasks(),
    const Profile(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Quran Meadow',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // TODO: Replace body
        body: SafeArea(child: pages[tabManager.selectedTab]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index){
            tabManager.goToTab(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_rounded),
              label: 'My Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
