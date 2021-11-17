import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sams/model/staff_model.dart';

class AppDrawer extends StatefulWidget {

  Staff staff;

  AppDrawer ({ Key? key, required this.staff }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppDrawerState();
  }
}

class _AppDrawerState extends State<AppDrawer> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
                backgroundImage: NetworkImage(
                    "https://scontent.fcmb11-1.fna.fbcdn.net/v/t1.6435-9/106738599_3128599713890082_4023191232412752912_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_RwQr0pKCtsAX_qAaKK&_nc_ht=scontent.fcmb11-1.fna&oh=d510f9c99d56d699d160c2bb5f0a209f&oe=61B1B5EB"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
            alignment: Alignment.center,
            child: Text(
              "Tharuka Sarathchandra",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            alignment: Alignment.center,
            child: Text(
              "Lecturer",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
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
            onTap: () => selectDestination(4),
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
