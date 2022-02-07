import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({this.error = 'Ha ocurrido un error!'});

  @override
  Widget build(BuildContext context) {
    return Text(
      error,
      style: const TextStyle(color: Colors.red, fontSize: 20),
    );
  }
}
