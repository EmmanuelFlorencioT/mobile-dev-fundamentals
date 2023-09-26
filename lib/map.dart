import 'package:complete_app/about.dart';
import 'package:complete_app/new_user.dart';
import 'package:complete_app/settings.dart';
import 'package:complete_app/sliding_panel.dart';
import 'package:flutter/material.dart';
import 'package:complete_app/utils/constants.dart' as my_constants;

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    //Check for the device size. To scale the height and width of the image.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: my_constants.appPurple,
      appBar: AppBar(
        title: Text(
          'Map',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: my_constants.appPurple,
        foregroundColor: my_constants.appYellow,
      ),
      endDrawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(24),
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              DrawerItem(moduleName: 'New User', moduleIndex: 0),
              DrawerItem(moduleName: 'About', moduleIndex: 1),
              DrawerItem(moduleName: 'See Map', moduleIndex: 2),
              DrawerItem(moduleName: 'Settings', moduleIndex: 3),
              DrawerItem(moduleName: 'Sliding Panel', moduleIndex: 4),
            ],
          ),
        ),
        backgroundColor: my_constants.appPurple,
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height - 56, //Minus the height of the appbar
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(120)),
              color: Colors.white,
            ),
            child: Column(),
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
        break;
      case 3:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 4:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyPanel()));
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
