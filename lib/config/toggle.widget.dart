import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure this import for using Provider
import '../main.dart';
class ToggleDarkModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);

    return ListTile(
      title: Text(
        'Mode Sombre',
        style: TextStyle(fontSize: 22),
      ),
      leading: Icon(Icons.lightbulb_outline, size: 30,),
      onTap: () {
        themeNotifier.toggleTheme();
      },
    );
  }
}
