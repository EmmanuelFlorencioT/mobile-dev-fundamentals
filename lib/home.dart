import 'package:complete_app/bottom_navbar.dart';
import 'package:complete_app/new_user.dart';
import 'package:complete_app/settings.dart';
import 'package:complete_app/sliding_panel.dart';
import 'package:flutter/material.dart';
import 'package:complete_app/utils/constants.dart' as my_constants;
import 'package:complete_app/about.dart';
import 'package:complete_app/map.dart';
import 'package:complete_app/utils/singleton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];

  @override
  void initState() {
    users.add('0#name0#mail0#22.15654#-101.2548');
    users.add('1#name1#mail1#24.15654#-124.2548');
    users.add('2#name2#mail2#11.15654#-123.2548');
    users.add('3#name3#mail3#25.15654#-122.2548');
    users.add('4#name4#mail4#22.15654#-100.2548');
    users.add('5#name5#mail5#55.15654#-99.2548');
    users.add('6#name6#mail6#45.15654#-34.2548');
    users.add('7#name7#mail7#44.15654#-120.2548');
    users.add('8#name8#mail8#13.15654#-11.2548');
    users.add('9#name9#mail9#99.15654#-30.2548');

    super.initState();
  }

  Singleton singleton = Singleton();

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
        backgroundColor: my_constants.appPurple,
        child: Container(
          padding: EdgeInsets.all(24),
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              Container(
                child: ListTile(
                  title: Text(
                    singleton.username,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                height: 30,
              ),
              Container(
                child: ListTile(
                  title: Text(
                    singleton.email,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                  ),
                ),
                height: 20,
              ),
              SizedBox(
                height: 15,
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
            color: singleton.isDarkTheme
                ? my_constants.appDarkBg
                : my_constants.appLightBg,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Card(
                    color: my_constants.appYellow,
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3, child: CardHeader(header: 'User')),
                            Expanded(
                                flex: 3, child: CardHeader(header: 'Mail')),
                            Expanded(
                                flex: 5, child: CardHeader(header: 'Buttons'))
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
                            color: singleton.isDarkTheme
                                ? my_constants.appDarkListItem
                                : my_constants.appLightListItem,
                            child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: CardData(
                                          data: data[1],
                                          isDarkTheme: singleton.isDarkTheme,
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: CardData(
                                          data: data[2],
                                          isDarkTheme: singleton.isDarkTheme,
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                singleton.username_action =
                                                    data[1];
                                                singleton.email_action =
                                                    data[2];
                                                showEditAlert(context);
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: my_constants.appYellow,
                                              ),
                                            ),
                                            // const SizedBox(
                                            //   width: 10,
                                            // ),
                                            IconButton(
                                              onPressed: () {
                                                singleton.username_action =
                                                    data[1];
                                                singleton.email_action =
                                                    data[2];
                                                showDeleteAlert(context);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.pin_drop),
                                              color: Colors.blue,
                                              onPressed: () {
                                                setState(() {
                                                  singleton.latitude_user =
                                                      double.parse(data[3]);
                                                  singleton.longitude_user =
                                                      double.parse(data[4]);
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Map()));
                                                });
                                              },
                                            ),
                                          ],
                                        ))
                                  ],
                                )),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: my_constants.appPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            fixedSize: Size(size.width * 0.75, 45)),
                        child: const Text(
                          'Alert',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
      },
    );
  }

  void showEditAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to edit this user?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'User: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(singleton.username_action),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(singleton.email_action),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showDeleteAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete this user?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'User: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(singleton.username_action),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(singleton.email_action),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: my_constants.appPurple,
              ),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
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
      case 5:
        Navigator.of(context).push(
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

class CardData extends StatelessWidget {
  final String data;
  final bool isDarkTheme;

  const CardData({super.key, required this.data, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: isDarkTheme
              ? my_constants.appLightListItem
              : my_constants.appPurple,
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
