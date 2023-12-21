import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/login/services/login_services.dart';
import 'package:icare_tagum_admin/login/widgets/login_textfield.dart';
import 'package:icare_tagum_admin/side_nav/side_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 798,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5.0,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                height: 435,
                width: 399,
                child: Image.asset('lib/assets/images/logo.png', scale: 12.5),
              ),
              Container(
                height: 435,
                width: 399,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF008348),
                      Color(0xFF319F43),
                    ],
                  ),
                ),
                padding: EdgeInsets.all(55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.admin_panel_settings_rounded,
                      color: Colors.white,
                      size: 105,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    LoginTextfield(
                      hintText: 'Email',
                      icon: Icons.person_2_rounded,
                      controller: emailController,
                      obscure: false,
                    ),
                    LoginTextfield(
                      hintText: 'Password',
                      icon: Icons.password_rounded,
                      controller: passwordController,
                      obscure: true,
                    ),
                    GestureDetector(
                      onTap: () {
                        signIn(
                          context,
                          emailController,
                          passwordController,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: 37,
                          width: 151,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: const Text(
                            'Log In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
