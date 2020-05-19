import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import '../widgets/input_search.widget.dart';
import '../widgets/gif_list.widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (this._search == null) {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=BpETrXyv7yg2HtbALDiLjzkpMKE8ibJc&limit=20&rating=G');
    } else {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=BpETrXyv7yg2HtbALDiLjzkpMKE8ibJc&q=${this._search}&limit=19&offset=${this._offset}&rating=G&lang=pt');
    }

    return json.decode(response.body);
  }

  int _getCount(List data) {
    if (this._search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  void _changeOffset() {
    setState(() {
      this._offset += 19;
    });
  }

  @override
  void initState() {
    super.initState();

    this._getGifs().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: GestureDetector(
          child: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif",
          ),
          onTap: () {
            setState(() {
              this._search = null;
              this._offset = 0;
            });
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          InputSearch(
            submittedFunction: (String text) {
              setState(() {
                this._search = text;
                this._offset = 0;
              });
            },
          ),
          GifList(
            future: this._getGifs(),
            itemCountFunction: this._getCount,
            changeOffset: this._changeOffset,
            search: this._search,
          ),
        ],
      ),
    );
  }
}
