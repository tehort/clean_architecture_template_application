import 'package:flutter/material.dart';
import 'package:home/src/presentation/home/widgets/home_page_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      drawer: const HomePageDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('JWT Token: '),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Revoke Token'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Refresh Token'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Test Token'),
            ),
          ),
        ],
      ),
    );
  }
}
