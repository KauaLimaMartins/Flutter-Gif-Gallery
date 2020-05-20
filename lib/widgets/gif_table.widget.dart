import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/gif.screen.dart';

class GifTable extends StatelessWidget {
  GifTable(this.context, this.snapshot,
      {@required this.itemCountFunction,
      @required this.search,
      @required this.changeOffset});

  final BuildContext context;
  final AsyncSnapshot snapshot;

  final Function itemCountFunction;
  final Function changeOffset;
  final String search;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: this.itemCountFunction(this.snapshot.data['data']),
      itemBuilder: (BuildContext context, int index) {
        if (this.search == null || index < snapshot.data['data'].length) {
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: this.snapshot.data['data'][index]['images']['fixed_height']
                  ['url'],
              height: 300.0,
              fit: BoxFit.cover,
            ),
            onLongPress: () {
              Share.share(this.snapshot.data['data'][index]['images']
                  ['fixed_height']['url']);
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      GifScreen(this.snapshot.data['data'][index]),
                ),
              );
            },
          );
        } else if (this.search.isNotEmpty) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 70.0,
                  ),
                  Text(
                    'Carregar mais...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              onTap: this.changeOffset,
            ),
          );
        }
      },
    );
  }
}
