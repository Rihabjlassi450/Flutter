import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../menu/drawer.widget.dart';

void main() {
  // Activer le mode de débogage
  //debugPaintSizeEnabled = true;
  runApp(EducationPage());
}
class EducationPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Diplome de baccalauréat',
      'subtitle': 'Lycée Agareb ',
      'description': 'diplome de baccalauréat en sience expérimental',
      'date':'2014',
    },
    {
      'title': 'Diplome en licence national en développement',
      'subtitle': 'Iset sfax',
      'description': 'je suis diplome en licence national en technologies de l informatique spécialité developpement des systèmes',
      'date':'2023',

    },
    {
      'title': 'Diplome en mastère professionnel en Développement des Systèmes Informatiques et Réseaux',
      'subtitle': 'Iset sfax',
      'date':'en cours',

    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:MyDrawer(),
        appBar: AppBar(title: Text('Detail Education'),
          backgroundColor: Color(0xFF1BBDB8),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context,"/home");// retour à la page précédente
            },
          ),
          //Changer la couleur ici

        ),

        body: ListView.builder(

          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.school),
              ),
              title: Text(items[index]['title']!),
              subtitle: Text(items[index]['subtitle']!),
              trailing: Text(items[index]['date']!),
              //Icon(Icons.arrow_forward_ios),
              /*onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(items[index]['title']!),
                      content: Text(items[index]['description']!),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  },
                );
              },*/
            );
          },
        ),

    );
  }
}