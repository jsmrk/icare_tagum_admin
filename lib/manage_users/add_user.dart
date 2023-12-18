import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/manage_users/widgets/add_user_button.dart';
import 'package:icare_tagum_admin/manage_users/widgets/add_user_textfield.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String _selectedRole = 'Moderator';
  List<String> role = ['Moderator', 'Administrator'];
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final positionController = TextEditingController();
  final departmentController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 750,
        top: 150,
        bottom: 150,
        right: 550,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          side: BorderSide.none),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(55),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add User',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 35),
                  AddUserTextfield(
                    label: const Text('Name'),
                    controller: nameController,
                  ),
                  const SizedBox(height: 17),
                  AddUserTextfield(
                    label: const Text('Email'),
                    controller: emailController,
                  ),
                  const SizedBox(height: 17),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: .3),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          color: Color.fromARGB(255, 89, 89, 89)),
                      underline: const SizedBox.square(),
                      value: _selectedRole,
                      items: role.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (item) {
                        setState(() {
                          _selectedRole = item!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 17),
                  AddUserTextfield(
                    label: const Text('Position'),
                    controller: positionController,
                  ),
                  const SizedBox(height: 17),
                  AddUserTextfield(
                    label: const Text('Department'),
                    controller: departmentController,
                  ),
                  const SizedBox(height: 17),
                  AddUserTextfield(
                    label: const Text('Password'),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddUserButton(
                        buttonName: 'Close',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        tColor: Colors.white,
                        bColor: Colors.grey,
                        icon: Icons.close,
                      ),
                      AddUserButton(
                        buttonName: 'Add User',
                        onTap: () {},
                        tColor: Colors.white,
                        bColor: Colors.green,
                        icon: Icons.add,
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
