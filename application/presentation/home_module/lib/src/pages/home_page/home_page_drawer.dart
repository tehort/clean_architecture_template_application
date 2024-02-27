import 'package:app_module/app_module.dart';
import 'package:authentication_module/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/home_module.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text('User name'),
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              context.read<HomeTabBloc>().add(
                    TabChangedEvent(homeTab: HomeTab.homePage),
                  );
              Navigator.pop(context);
            },
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
          ListTile(
            title: const Text('Token information'),
            leading: const Icon(Icons.info),
            onTap: () {
              context.read<HomeTabBloc>().add(
                    TabChangedEvent(homeTab: HomeTab.tokenInformationPage),
                  );
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sign out'),
            leading: const Icon(Icons.logout),
            onTap: () => context.read<AuthenticationBloc>().add(const LoggedOut()),
          ),
        ],
      ),
    );
  }
}
