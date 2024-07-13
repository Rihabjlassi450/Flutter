import 'package:flutter/material.dart';

void main() {
  runApp(CompetencePage());
}

class CompetencePage extends StatefulWidget {
  @override
  _CompetencePageState createState() => _CompetencePageState();
}

class _CompetencePageState extends State<CompetencePage> {
  List<Map<String, dynamic>> _competences = [
    {'framework': 'Flutter', 'niveau': 80},
    {'framework': 'React Native', 'niveau': 70},
    {'framework': 'Angular', 'niveau': 65},
    {'framework': 'Vue.js', 'niveau': 60},
    {'framework': 'Swift', 'niveau': 50},
  ];

  void _ajouterCompetence(String framework, int niveau) {
    setState(() {
      _competences.add({'framework': framework, 'niveau': niveau});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Niveau de compétence"),
        backgroundColor: Color(0xFF1BBDB8),
      ),
      body: ListView.builder(
        itemCount: _competences.length,
        itemBuilder: (context, index) {
          final competence = _competences[index];
          return ListTile(
            title: Text(competence['framework']),
            subtitle: LinearProgressIndicator(
              value: competence['niveau'] / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            trailing: Text('${competence['niveau']}%'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1BBDB8),
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => _AjouterCompetenceDialog(),
          );
          if (result != null) {
            _ajouterCompetence(result['framework'], result['niveau']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _AjouterCompetenceDialog extends StatefulWidget {
  @override
  __AjouterCompetenceDialogState createState() => __AjouterCompetenceDialogState();
}

class __AjouterCompetenceDialogState extends State<_AjouterCompetenceDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _framework;
  late int _niveau;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter une compétence'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Framework'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un nom de framework';
                }
                return null;
              },
              onSaved: (value) {
                _framework = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Niveau'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un niveau de compétence';
                }
                final niveau = int.tryParse(value);
                if (niveau == null || niveau < 0 || niveau > 100) {
                  return 'Veuillez entrer un niveau de compétence entre 0 et 100';
                }
                return null;
              },
              onSaved: (value) {
                _niveau = int.parse(value!);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState?.save();
              Navigator.of(context).pop({'framework': _framework, 'niveau': _niveau});
            }
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
