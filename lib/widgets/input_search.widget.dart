import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  InputSearch({
    @required this.submittedFunction,
  });

  Function submittedFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(20.0),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          decoration: InputDecoration(
            labelText: 'Pesquisar',
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          onSubmitted: this.submittedFunction),
    );
  }
}
