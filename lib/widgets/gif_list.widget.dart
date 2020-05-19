import 'package:flutter/material.dart';

import '../widgets/error_message.widget.dart';
import '../widgets/loading_indicator.widget.dart';
import '../widgets/gif_table.widget.dart';

class GifList extends StatelessWidget {
  GifList({
    @required this.future,
    @required this.itemCountFunction,
    @required this.search,
    @required this.changeOffset,
  });

  final Future<Map> future;
  final Function itemCountFunction;
  final Function changeOffset;

  final String search;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: this.future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return LoadingIndicator();
            default:
              if (snapshot.hasError) {
                return ErrorMessage();
              } else {
                return GifTable(
                  context,
                  snapshot,
                  itemCountFunction: this.itemCountFunction,
                  changeOffset: this.changeOffset,
                  search: this.search,
                );
              }
          }
        },
      ),
    );
  }
}
