import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/global.params.dart';
import '../config/toggle.widget.dart';
import '../main.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blueGrey],
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/profile1.jpg"),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Rihab Jlassi',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
          ...(GlobalParams.menus as List).map((item) {
            return ListTile(
              title: Text(
                '${item['title']}',
                style: TextStyle(fontSize: 22),
              ),
              leading: item['icon'],
              trailing: Icon(Icons.arrow_right, color: Colors.grey),
              onTap: () async {
                if ('${item['title']}' != "Déconnexion") {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "${item['route']}");
                } else {
                  prefs = await SharedPreferences.getInstance();
                  prefs.setBool("connecte", false);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/authentification', (Route<dynamic> route) => false);
                }
              },
            );
          }),
          // Add ToggleDarkModeButton here
          ToggleDarkModeButton(),
        ],
      ),
    );
  }
}
