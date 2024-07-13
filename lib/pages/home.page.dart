import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Cv Details'),
          backgroundColor: Color(0xFF1BBDB8), //Changer la couleur ici
        ),
        body: Center(
            child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/profil.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 60),
                  child: Text(
                    'Profil ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profil');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/personalinfo.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    'Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/info');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/experience.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    'Experience ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/experience');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/e.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    'Education ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/education');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/objectif.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    'Objectif ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/objectif');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/competence.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    'Competence',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/competence');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/map.png'),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    'Position',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              onTap: () async { const url =
                  'https://www.google.com/maps/search/?api=1&query=34.739676321259275,10.524171573667399';
              await _launchURL(url);
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/logout.png'),
              ),
              onTap: () {
                _Deconnexion(context);
              },
            ),
          ],
        )));
  }

  Future<void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
