import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GifScreen extends StatelessWidget {
  GifScreen(this._gifData);

  final Map _gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this._gifData['title'],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(this._gifData['images']['fixed_height']['url']);
            },
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(this._gifData['images']['fixed_height']['url']),
      ),
    );
  }
}
