import 'package:flutter/material.dart';
import 'package:quran_meadows/screens/profile/circle_image.dart';
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
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Quran Meadow',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.teal,
                      Color.fromRGBO(133, 78, 155, 1),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleImage(
                        imageUrl: "assets/images/morocco-tiles-background.jpg",
                        imageRadius: 35),
                    Text(
                      "Username",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      "Title of course/level activated",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.menu_book_rounded, color: Colors.teal),
                title: Text("التفسير الموضوعي",
                  style: Theme.of(context).textTheme.bodyText2),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.menu_book_rounded, color: Colors.teal),
                title: Text("المتشابهات",
                  style: Theme.of(context).textTheme.bodyText2,),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.menu_book_rounded, color: Colors.teal),
                title: Text("أسباب النزول",
                  style: Theme.of(context).textTheme.bodyText2,),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.info_rounded, color: Colors.teal),
                title: Text(
                  "About the app",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.teal),
                title: Text("Settings",
                  style: Theme.of(context).textTheme.bodyText2,),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SafeArea(child: pages[tabManager.selectedTab]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
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
