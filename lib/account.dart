import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          // Nama User
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topCenter,
            child: const Text(
              'Safira Putri',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Foto Profil
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
            radius: 70,
          ),
          const SizedBox(height: 30),

          // Pengaturan Akun
          ListTile(
            leading: const Iconify(
              Mdi.account_cog,
              size: 28,
              color: Color(0xFF802929),
            ),
            title: const Text(
              'Pengaturan Akun',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF802929)),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(),

          ListTile(
            leading: const Iconify(
              Ri.logout_box_line,
              size: 28,
              color: Color(0xFF802929),
            ),
            title: const Text(
              'Keluar',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing:
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF802929)),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          const Divider(),

          // const Spacer(),
        ],
      ),
    );
  }
}
