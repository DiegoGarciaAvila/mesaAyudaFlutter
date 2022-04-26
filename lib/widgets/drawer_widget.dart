import 'package:flutter/material.dart';
import 'package:mesa_ayuda/themes/theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        _drawerHeaderBackground(),
        const _itemListDrawer(
            title: 'Home',
            leading: Icons.home_sharp,
            trailing: Icons.arrow_forward_ios,
            route: 'UserHome'),
        const _itemListDrawer(
            title: 'Usuarios registrados',
            leading: Icons.supervised_user_circle,
            trailing: Icons.arrow_forward_ios,
            route: 'UserHome'),
        const _itemListDrawer(
            title: 'Personal de informatica',
            leading: Icons.supervised_user_circle_outlined,
            trailing: Icons.arrow_forward_ios,
            route: 'UserHome'),
        const _itemListDrawer(
            title: 'Peticiones',
            leading: Icons.library_books_sharp,
            trailing: Icons.arrow_forward_ios,
            route: 'UserHome'),
      ],
    ));
  }
}

class _drawerHeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            // _imageDrawerHeader(),
            _dateUserDraweHeader(),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppTheme.primary,
      ),
    );
  }
}

class _dateUserDraweHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Name", style: TextStyle(color: Colors.black)),
            accountEmail: Text("Email", style: TextStyle(color: Colors.black)),
            currentAccountPicture: Container(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/logo_EdoMex.png'),
                  backgroundColor: Colors.amber.shade200,
                ),
              ),

            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://blog.sebastiano.dev/content/images/2019/07/1_l3wujEgEKOecwVzf_dqVrQ.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _itemListDrawer extends StatelessWidget {
  final String title;
  final IconData leading;
  final IconData trailing;
  final String route;

  const _itemListDrawer(
      {Key? key,
      required this.title,
      required this.leading,
      required this.trailing,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title"),
      leading: Icon(leading),
      trailing: Icon(trailing),
      onTap: () {
        Navigator.pushNamed(context, '$route');
      },
    );
  }
}
