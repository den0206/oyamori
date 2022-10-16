import 'package:flutter/material.dart';

class GetHealthScreen extends StatelessWidget {
  const GetHealthScreen({super.key});

  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Center(
        child: Text("Health"),
      ),
    );
  }
}
