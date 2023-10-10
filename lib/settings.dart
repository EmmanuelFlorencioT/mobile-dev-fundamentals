import 'package:complete_app/bottom_navbar.dart';
import 'package:complete_app/new_user.dart';
import 'package:complete_app/sliding_panel.dart';
import 'package:complete_app/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:complete_app/about.dart';
import 'package:complete_app/map.dart';
import 'package:complete_app/utils/constants.dart' as my_constants;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    //Check for the device size. To scale the height and width of the image.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: my_constants.appPurple,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: my_constants.appPurple,
        foregroundColor: my_constants.appYellow,
      ),
      endDrawer: Drawer(
        backgroundColor: my_constants.appPurple,
        child: Container(
          padding: EdgeInsets.all(24),
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              ListTile(
                title: Text(
                  singleton.username,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              ListTile(
                title: Text(
                  singleton.email,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 14),
                ),
              ),
              DrawerItem(moduleName: 'New User', moduleIndex: 0),
              DrawerItem(moduleName: 'About', moduleIndex: 1),
              DrawerItem(moduleName: 'See Map', moduleIndex: 2),
              DrawerItem(moduleName: 'Settings', moduleIndex: 3),
              DrawerItem(moduleName: 'Sliding Panel', moduleIndex: 4),
              DrawerItem(moduleName: 'Bottom Navbar', moduleIndex: 5),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height - 56, //Minus the height of the appbar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(120)),
              color: singleton.isDarkTheme
                  ? my_constants.appDarkBg
                  : my_constants.appLightBg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //Toggle the isDarkTheme value
                      singleton.isDarkTheme =
                          singleton.isDarkTheme ? false : true;
                    });
                  },
                  child: Text('Change Theme'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String moduleName;
  final int moduleIndex;
  const DrawerItem(
      {super.key, required this.moduleName, required this.moduleIndex});

  void navigateToScreen(BuildContext context) {
    switch (moduleIndex) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NewUser()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const About()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Map()));
        break;
      case 3:
        break;
      case 4:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyPanel()));
        break;
      case 5:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomNavbar()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        moduleName,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pop(context);
        navigateToScreen(context);
      },
    );
  }
}
