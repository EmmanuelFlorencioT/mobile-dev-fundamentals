import 'package:complete_app/new_user.dart';
import 'package:complete_app/settings.dart';
import 'package:complete_app/sliding_panel.dart';
import 'package:flutter/material.dart';
import 'package:complete_app/utils/constants.dart' as my_constants;
import 'package:complete_app/about.dart';
import 'package:complete_app/map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];

  @override
  void initState() {
    users.add('0#name0#mail0');
    users.add('1#name1#mail1');
    users.add('2#name2#mail2');
    users.add('3#name3#mail3');
    users.add('4#name4#mail4');
    users.add('5#name5#mail5');
    users.add('6#name6#mail6');
    users.add('7#name7#mail7');
    users.add('8#name8#mail8');
    users.add('9#name9#mail9');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Check for the device size. To scale the height and width of the image.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
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
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                  color: my_constants.appYellow,
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(flex: 4, child: CardHeader(header: 'User')),
                          Expanded(flex: 4, child: CardHeader(header: 'Mail')),
                          Expanded(
                              flex: 4, child: CardHeader(header: 'Buttons'))
                        ],
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = users[index].split('#');
                        /*
                          The data variable handle all the entries in the list:
                          data[0] = id
                          data[1] = userN
                          data[2] = mailN
                          */

                        return Card(
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4, child: CardData(data: data[1])),
                                  Expanded(
                                      flex: 4, child: CardData(data: data[2])),
                                  Expanded(
                                      flex: 4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: my_constants.appYellow,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        'Alert',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: my_constants.appPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: Size(size.width * 0.75, 45)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('My first alert!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text('This is my sample text'), Icon(Icons.warning)],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const NewUser()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const About()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Map()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MyPanel()));
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

class CardData extends StatelessWidget {
  final String data;

  const CardData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: my_constants.appPurple,
          fontSize: 15,
          fontWeight: FontWeight.bold),
    );
  }
}

class CardHeader extends StatelessWidget {
  final String header;

  const CardHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.header,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}
