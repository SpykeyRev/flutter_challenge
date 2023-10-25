import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/base/widget/generic_error.dart';

/// The not found screen
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const GenericError(),
    );
  }
}
