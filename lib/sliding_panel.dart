import 'package:complete_app/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:complete_app/new_user.dart';
import 'package:complete_app/about.dart';
import 'package:complete_app/settings.dart';
import 'package:complete_app/map.dart';
import 'package:complete_app/utils/constants.dart' as my_constants;

//Sliding Up Panel
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyPanel extends StatefulWidget {
  const MyPanel({super.key});

  @override
  State<MyPanel> createState() => _MyPanelState();
}

class _MyPanelState extends State<MyPanel> {
  // late ScrollController scrollController;
  // SlidingUpPanelController panelController = SlidingUpPanelController();
  // double minBound = 0;
  // double upperBound = 1.0;
  // @override
  // void initState() {
  //   scrollController = ScrollController();
  //   scrollController.addListener(() {
  //     if (scrollController.offset >=
  //             scrollController.position.maxScrollExtent &&
  //         !scrollController.position.outOfRange) {
  //       panelController.expand();
  //     } else if (scrollController.offset <=
  //             scrollController.position.minScrollExtent &&
  //         !scrollController.position.outOfRange) {
  //       panelController.anchor();
  //     } else {}
  //   });
  //   super.initState();
  // }
  bool showPanel = false;

  @override
  Widget build(BuildContext context) {
    //Check for the device size. To scale the height and width of the image.
    final size = MediaQuery.of(context).size;

    // return Scaffold(
    //   backgroundColor: my_constants.appPurple,
    //   appBar: AppBar(
    //     title: Text(
    //       'Sliding Panel Demo',
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     backgroundColor: my_constants.appPurple,
    //     foregroundColor: my_constants.appYellow,
    //   ),
    //   endDrawer: Drawer(
    //     child: Container(
    //       padding: EdgeInsets.all(24),
    //       child: ListView(
    //         padding: EdgeInsets.all(30),
    //         children: [
    //           DrawerItem(moduleName: 'New User', moduleIndex: 0),
    //           DrawerItem(moduleName: 'About', moduleIndex: 1),
    //           DrawerItem(moduleName: 'See Map', moduleIndex: 2),
    //           DrawerItem(moduleName: 'Settings', moduleIndex: 3),
    //           DrawerItem(moduleName: 'Sliding Panel', moduleIndex: 4),
    //         ],
    //       ),
    //     ),
    //     backgroundColor: my_constants.appPurple,
    //   ),
    //   body: Stack(
    //     children: [
    //       Container(
    //         width: size.width,
    //         height: size.height - 56, //Minus the height of the appbar
    //         decoration: const BoxDecoration(
    //           borderRadius: BorderRadius.only(topRight: Radius.circular(120)),
    //           color: Colors.white,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             ElevatedButton(onPressed: () {}, child: Text('Show Panel'))
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );

    //Flutter Sliding Up Panel
    // return Stack(
    //   children: <Widget>[
    //     Scaffold(
    //       appBar: AppBar(
    //         title: Text(
    //           'Sliding Panel Demo',
    //           style: TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //         backgroundColor: my_constants.appPurple,
    //         foregroundColor: my_constants.appYellow,
    //       ),
    //       endDrawer: Drawer(
    //         child: Container(
    //           padding: EdgeInsets.all(24),
    //           child: ListView(
    //             padding: EdgeInsets.all(30),
    //             children: [
    //               DrawerItem(moduleName: 'New User', moduleIndex: 0),
    //               DrawerItem(moduleName: 'About', moduleIndex: 1),
    //               DrawerItem(moduleName: 'See Map', moduleIndex: 2),
    //               DrawerItem(moduleName: 'Settings', moduleIndex: 3),
    //               DrawerItem(moduleName: 'Sliding Panel', moduleIndex: 4),
    //             ],
    //           ),
    //         ),
    //         backgroundColor: my_constants.appPurple,
    //       ),
    //       body: Center(
    //         child: ListView(
    //           padding: EdgeInsets.symmetric(horizontal: 50.0),
    //           children: <Widget>[
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('Show panel'),
    //               onPressed: () {
    //                 panelController.expand();
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('Anchor panel'),
    //               onPressed: () {
    //                 panelController.anchor();
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('Expand panel'),
    //               onPressed: () {
    //                 panelController.expand();
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('Collapse panel'),
    //               onPressed: () {
    //                 panelController.collapse();
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('Hide panel'),
    //               onPressed: () {
    //                 panelController.hide();
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('minimumBound 0.3'),
    //               onPressed: () {
    //                 setState(() {
    //                   minBound = 0.3;
    //                 });
    //               },
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //             ),
    //             TextButton(
    //               child: Text('upperBound 0.7'),
    //               onPressed: () {
    //                 setState(() {
    //                   upperBound = 0.7;
    //                 });
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SlidingUpPanelWidget(
    //       child: Container(
    //         margin: EdgeInsets.symmetric(horizontal: 15.0),
    //         decoration: ShapeDecoration(
    //           color: Colors.white,
    //           shadows: [
    //             BoxShadow(
    //                 blurRadius: 5.0,
    //                 spreadRadius: 2.0,
    //                 color: const Color(0x11000000))
    //           ],
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(10.0),
    //               topRight: Radius.circular(10.0),
    //             ),
    //           ),
    //         ),
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               alignment: Alignment.center,
    //               child: Row(
    //                 children: <Widget>[
    //                   Icon(
    //                     Icons.menu,
    //                     size: 30,
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(
    //                       left: 8.0,
    //                     ),
    //                   ),
    //                   Text(
    //                     'click or drag',
    //                   )
    //                 ],
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //               ),
    //               height: 50.0,
    //             ),
    //             Divider(
    //               height: 0.5,
    //               color: Colors.grey[300],
    //             ),
    //             Flexible(
    //               child: Container(
    //                 child: ListView.separated(
    //                   controller: scrollController,
    //                   physics: ClampingScrollPhysics(),
    //                   itemBuilder: (context, index) {
    //                     return ListTile(
    //                       title: Text('list item $index'),
    //                     );
    //                   },
    //                   separatorBuilder: (context, index) {
    //                     return Divider(
    //                       height: 0.5,
    //                     );
    //                   },
    //                   shrinkWrap: true,
    //                   itemCount: 20,
    //                 ),
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ],
    //           mainAxisSize: MainAxisSize.min,
    //         ),
    //       ),
    //       controlHeight: 50.0,
    //       anchor: 0.4,
    //       minimumBound: minBound,
    //       upperBound: upperBound,
    //       panelController: panelController,
    //       onTap: () {
    //         ///Customize the processing logic
    //         if (SlidingUpPanelStatus.expanded == panelController.status) {
    //           panelController.collapse();
    //         } else {
    //           panelController.expand();
    //         }
    //       },
    //       enableOnTap: true,
    //       //Enable the onTap callback for control bar.
    //       dragDown: (details) {
    //         print('dragDown');
    //       },
    //       dragStart: (details) {
    //         print('dragStart');
    //       },
    //       dragCancel: () {
    //         print('dragCancel');
    //       },
    //       dragUpdate: (details) {
    //         print(
    //             'dragUpdate,${panelController.status == SlidingUpPanelStatus.dragging ? 'dragging' : ''}');
    //       },
    //       dragEnd: (details) {
    //         print('dragEnd');
    //       },
    //     ),
    //   ],
    // );

    //Sliding Up Panel
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sliding Panel Demo',
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
              DrawerItem(moduleName: 'Bottom Navbar', moduleIndex: 5),
            ],
          ),
        ),
        backgroundColor: my_constants.appPurple,
      ),
      body: Stack(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  //This simulates the toggle function
                  showPanel = showPanel ? false : true;
                });
              },
              child: Text('Open Panel')),
          SlidingUpPanel(
            //When opening the View this is the state of the panel
            defaultPanelState: showPanel ? PanelState.OPEN : PanelState.CLOSED,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60),
              topLeft: Radius.circular(60),
            ),
            color: my_constants.appPurple,
            minHeight: showPanel ? size.height * 0.8 : 0,
            maxHeight: size.height * 0.8,
            //The content within the sliding panel
            panel: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                  color: my_constants.appPurple,
                ),
                child: Stack(
                  //DOES NOT Cut the content to the size of the widget
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 50, right: 30, bottom: 40, left: 30),
                      //Since we are NOT cutting the content inside, we add a Scroller if the child content overflows the space
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Would you like to delete this user?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
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
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 4:
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
