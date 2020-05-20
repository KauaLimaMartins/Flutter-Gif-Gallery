import 'package:flutter/material.dart';

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
