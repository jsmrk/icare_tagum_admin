import 'package:flutter/material.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 435,
              width: 399,
              color: Colors.blue,
            ),
            Container(
              height: 435,
              width: 399,
              color: Colors.red,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.admin_panel_settings_rounded),
                  Text('Login'),
                  TextField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
