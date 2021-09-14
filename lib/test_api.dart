import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  const TestApi({Key? key}) : super(key: key);

  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  String _response = 'vide';

  Future<String> getAllCharacters() async {
    var uri = Uri.parse("https://rickandmortyapi.com/api/character");
    var responseFromApi = await http.get(uri);
    debugPrint(responseFromApi.body);
    setState(() {
      _response = responseFromApi.body;
    });
    return responseFromApi.body;
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        body: Text(_response),
        appBar: AppBar(title: Text("GET RICK & MORTY"), actions: <Widget>[
          TextButton(
            style: style,
            onPressed: getAllCharacters,
            child: const Text('GETTER'),
          ),
        ]));
  }
}
