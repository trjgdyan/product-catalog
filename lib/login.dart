import 'package:flutter/material.dart';
// import 'package:flutter_application_1/dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // icon back button to home screen
            AppBar(
                leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              style: ButtonStyle(
                iconSize: WidgetStatePropertyAll(40),
                foregroundColor:
                    WidgetStatePropertyAll<Color>(Color(0xFF802929)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
            Container(
              padding: const EdgeInsets.only(top: 50),
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                'Selamat Datang Kembali',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  // letterSpacing: 9,
                  color: Color(0xFF802929),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset(
                'assets/images/gedog.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 80, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon:
                            const Icon(Icons.email, color: Color(0xFF802929)),
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Color(0xFF802929),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                        decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFF802929)),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Color(0xFF802929),
                      ),
                    ))
                  ],
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF802929),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: const Size(250, 49),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: const Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
