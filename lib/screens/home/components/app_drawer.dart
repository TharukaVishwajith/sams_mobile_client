import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams/model/user_model.dart';
import 'package:sams/screens/login/login_screen.dart';
import 'package:sams/util/image_util.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppDrawerState();
  }
}

class _AppDrawerState extends State<AppDrawer> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final textTheme = theme.textTheme;
    var user = context.watch<UserModel>().currentUser;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 5),
            child: Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Colors.white),
              child: new CircleAvatar(
                radius: 50.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage: ImageUtil()
                    .imageFromBase64String(user.imageDataBase64).image
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            alignment: Alignment.center,
            child: Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.edit_location),
            title: Text('Change location'),
            selected: _selectedDestination == 0,
            onTap: () => selectDestination(0),
          ),
          // ListTile(
          //   leading: Icon(Icons.delete),
          //   title: Text('Item 2'),
          //   selected: _selectedDestination == 1,
          //   onTap: () => selectDestination(1),
          // ),
          // ListTile(
          //   leading: Icon(Icons.label),
          //   title: Text('Item 3'),
          //   selected: _selectedDestination == 2,
          //   onTap: () => selectDestination(2),
          // ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Profile',
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.mode_edit),
            title: Text('Edit profile'),
            selected: _selectedDestination == 3,
            onTap: () => selectDestination(3),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            selected: _selectedDestination == 4,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              // MaterialPageRoute(builder: (context) => LoginScreen());
            },
          ),
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
