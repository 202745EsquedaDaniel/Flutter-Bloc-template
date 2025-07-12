import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/auth/home/presentation/components/my_drawer_tile.dart';
import 'package:flutter_bloc_template/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_bloc_template/features/profile/presentation/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // app logo
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              Divider(color: Theme.of(context).colorScheme.secondary),

              //home list time
              MyDrawerTile(
                title: "H O M E ",
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(), //
              ),

              //Profile tile
              MyDrawerTile(
                title: "P R O F I L E ",
                icon: Icons.person,
                onTap: () {
                  //  pop menu drawer
                  Navigator.pop(context);

                  // get current user id
                  final user = context.read<AuthCubit>().currentUser;
                  String? uid = user!.uid;

                  //  navigate to settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(uid: uid),
                    ),
                  );
                },
              ),

              //S E A R C H tile
              MyDrawerTile(
                title: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const Spacer(),

              // logout list tile
              MyDrawerTile(
                title: "L O G O U T",
                icon: Icons.logout,
                onTap: () => context.read<AuthCubit>().logout(), //
              ),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
