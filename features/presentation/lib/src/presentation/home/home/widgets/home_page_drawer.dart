import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/presentation/app/theme/bloc/theme_bloc.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('User name'),
          ),
          const ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          const ListTile(
            title: Text('User information'),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: const Text('Change theme'),
            leading: const Icon(Icons.brightness_4),
            onTap: () => context.read<ThemeBloc>().add(ThemeEventToggle()),
          ),
          const ListTile(
            title: Text('Token information'),
            leading: Icon(Icons.info),
          ),
          const ListTile(
            title: Text('Sign out'),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}