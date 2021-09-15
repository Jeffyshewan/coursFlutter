import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:m2_cours/all_characters_response.dart';
import 'package:m2_cours/character.dart';
import 'package:m2_cours/new_screen.dart';

class TestApi extends StatefulWidget {
  const TestApi({Key? key}) : super(key: key);

  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  String _response = 'vide';
  List<Character> listCharacters = [];

  Future<void> getAllCharacters() async {
    var uri = Uri.parse("https://rickandmortyapi.com/api/character");
    var responseFromApi = await http.get(uri);
    if(responseFromApi.statusCode == 200) {
      AllCharactersResponse allCharact = AllCharactersResponse.fromJson(jsonDecode(responseFromApi.body));
      listCharacters = allCharact.results ?? [];
    }
    debugPrint(responseFromApi.body);
    setState(() {
      _response = responseFromApi.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        body: ListView.separated (
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: listCharacters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listCharacters[index].name ?? "vide"),
                leading: Image.network(listCharacters[index].image ?? "vide"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>NewScreen(character: listCharacters[index]) )
                  );
                },
              );
            },),


        appBar: AppBar(title: Text("GET RICK & MORTY"), actions: <Widget>[
          TextButton(
            style: style,
            onPressed: getAllCharacters,
            child: const Text('GETTER'),
          ),
        ])
    );
  }
}
