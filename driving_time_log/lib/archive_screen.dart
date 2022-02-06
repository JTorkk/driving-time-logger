import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Container(
        color: Colors.red,
        child: const Text('ArchiveScreen'),
      ),
    );
  }
}
